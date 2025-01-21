#!/bin/bash

# Configuration
PHOTO_DIR="${HOME}/Desktop/photos_to_print"
PRINTED_DIR="${PHOTO_DIR}/printed"
PRINTER="Canon_PRO_1100_series"
LOG_FILE="/tmp/photo_print.log"
NOTE_NAME="Photo Print Log"
TIME_LIMIT_HOURS=24

# Function to send iMessage
send_imessage() {
    local message="$1"
    osascript -e 'tell application "Messages"' \
              -e "    send \"$message\" to buddy \"cycomachead@gmail.com\"" \
              -e 'end tell'
}

# Function to append to Apple Notes
append_to_notes() {
    local message="$1"
    local date_str=$(date '+%Y-%m-%d %H:%M:%S')
    osascript <<EOF
tell application "Notes"
    tell account "iCloud"
        if not (exists note "$NOTE_NAME") then
            make new note with properties {name:"$NOTE_NAME"}
        end if
        set noteBody to body of note "$NOTE_NAME"
        set body of note "$NOTE_NAME" to noteBody & return & "$date_str: $message"
    end tell
end tell
EOF
}

# Function to check last print time from CUPS history
check_last_print_time() {
    # Get the timestamp of the last print job to our printer
    # Look at both completed and pending jobs
    local last_completed=$(lpstat -W completed | grep "$PRINTER" | head -n 1 | awk '{print $4, $5, $6, $7}')
    local last_pending=$(lpstat -W not-completed | grep "$PRINTER" | head -n 1 | awk '{print $4, $5, $6, $7}')

    process_time() {
        local time_str="$1"
        if [ -n "$time_str" ]; then
            # Convert time string to epoch
            local epoch=$(date -j -f "%a %b %d %H:%M:%S" "$time_str" "+%s" 2>/dev/null)
            if [ -n "$epoch" ]; then
                echo "$epoch"
                return 0
            fi
        fi
        echo "0"
    }

    local completed_epoch=$(process_time "$last_completed")
    local pending_epoch=$(process_time "$last_pending")

    # Use the most recent time between completed and pending
    local last_print_epoch
    if [ "$completed_epoch" -gt "$pending_epoch" ]; then
        last_print_epoch=$completed_epoch
    else
        last_print_epoch=$pending_epoch
    fi

    if [ "$last_print_epoch" -ne 0 ]; then
        local current_time=$(date +%s)
        local time_diff=$((current_time - last_print_epoch))
        local hours_diff=$((time_diff / 3600))

        log_message "⏳ Last print was $hours_diff hours ago"

        if [ $hours_diff -lt $TIME_LIMIT_HOURS ]; then
            return 1
        fi
    fi

    return 0
}

# Function to log messages
log_message() {
    local message="$1"
    local is_error=${2:-false}

    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $message" | tee -a "$LOG_FILE"
    append_to_notes "$message"

    if [ "$is_error" = true ]; then
        send_imessage "❌ Error: $message"
    fi
}

# Main function to print next N images
print-next-image() {
    local num_files=${1:-1}  # Default to 1 if no argument provided

    # Check if photos directory exists
    if [ ! -d "$PHOTO_DIR" ]; then
        log_message "Error: Directory '$PHOTO_DIR' does not exist" true
        return 1
    fi

    # Check last print time
    if ! check_last_print_time; then
                    local message="⏭️ Skipping print job - less than ${TIME_LIMIT_HOURS} hours since last print"
        log_message "$message"
        send_imessage "⏭️ $message"
        return 0
    fi

    # Create printed directory if it doesn't exist
    if [ ! -d "$PRINTED_DIR" ]; then
        log_message "📁 Creating directory: $PRINTED_DIR"
        mkdir -p "$PRINTED_DIR"
    fi

    # Find the first N image files by name
    local PHOTOS=$(find "$PHOTO_DIR" -maxdepth 1 -type f \
        -not -name ".*" \
        -and \( \
            -name "*.jpg" -or \
            -name "*.jpeg" -or \
            -name "*.png" -or \
            -name "*.heic" -or \
            -name "*.tif" -or \
            -name "*.tiff" -or \
            -name "*.JPG" -or \
            -name "*.JPEG" -or \
            -name "*.PNG" -or \
            -name "*.HEIC" -or \
            -name "*.TIF" -or \
            -name "*.TIFF" \
        \) | sort | head -n "$num_files")

    if [ -z "$PHOTOS" ]; then
        log_message "No image files found in $PHOTO_DIR" true
        return 1
    fi

    local success_count=0

    # Process each photo
    echo "$PHOTOS" | while read -r PHOTO; do
        local filename=$(basename "$PHOTO")
        log_message "🖨️ Processing file: $filename"

        # Print the photo
        log_message "Printing photo..."
        lp -d "$PRINTER" \
           -t "$filename" \
           -o media=4x6.FullBleed \
           -o CNIJPrintQuality=15 \
           -o CNIJAmountOfExtension=1 \
           -o CNIJPrintMode2=3 \
           -o CNIJPQualitySlider=2 \
           -o CNIJDisablePDEMarginAlert=1 \
           -o CNImageBrightnessSlider=30 \
           "$PHOTO"

        if [ $? -eq 0 ]; then
            log_message "✅ Print job submitted successfully"

            # Move the file to printed directory
            mv "$PHOTO" "$PRINTED_DIR/"

            if [ $? -eq 0 ]; then
                log_message "📦 File moved to $PRINTED_DIR"
                send_imessage "✅ Successfully printed: $filename"
                ((success_count++))
            else
                log_message "Error moving file to $PRINTED_DIR" true
            fi
        else
            log_message "Error: Printing failed" true
        fi
    done

    log_message "📊 Completed processing $success_count out of $num_files files"
    return 0
}

# If the script is being run directly (not sourced), execute with arguments
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    print-next-image "$@"
fi
