#!/bin/bash

# Configuration
PHOTO_DIR="${HOME}/Desktop/photos_to_print"
PRINTED_DIR="${PHOTO_DIR}/printed"
PRINTER="Canon_PRO_1100_series"
LOG_FILE="/tmp/photo_print.log"
NOTE_NAME="Photo Print Log"

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

# Function to monitor print job status
monitor_print_job() {
    local job_id="$1"
    local filename="$2"
    local max_attempts=60  # 5 minutes maximum wait
    local attempt=0

    while [ $attempt -lt $max_attempts ]; do
        local status=$(lpstat -W "completed" | grep "$job_id" > /dev/null 2>&1)
        if [ $? -eq 0 ]; then
            send_imessage "✅ Print completed: $filename"
            append_to_notes "Print completed: $filename"
            return 0
        fi

        # Check if job failed or was cancelled
        if ! lpstat -W "not-completed" | grep "$job_id" > /dev/null 2>&1; then
            send_imessage "❌ Print job failed or cancelled: $filename"
            append_to_notes "Print job failed or cancelled: $filename"
            return 1
        fi

        sleep 5
        ((attempt++))
    done

    send_imessage "⚠️ Print job status unknown (timeout): $filename"
    append_to_notes "Print job status unknown (timeout): $filename"
    return 1
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

    # Create printed directory if it doesn't exist
    if [ ! -d "$PRINTED_DIR" ]; then
        log_message "Creating directory: $PRINTED_DIR"
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
        log_message "Processing file: $PHOTO"

        # Print the photo
        log_message "Printing photo..."
        local job_id=$(lp -d "$PRINTER" \
           -o media=4x6.FullBleed \
           -o CNIJPrintQuality=15 \
           -o CNIJAmountOfExtension=1 \
           -o CNIJPrintMode2=3 \
           -o CNIJPQualitySlider=4 \
           -o CNIJDisablePDEMarginAlert=1 \
           -o CNImageBrightnessSlider=10 \
           "$PHOTO" | grep -o '[0-9]*$')

        if [ -n "$job_id" ]; then
            log_message "Print job submitted successfully (Job ID: $job_id)"

            # Monitor print job status
            monitor_print_job "$job_id" "$(basename "$PHOTO")"

            if [ $? -eq 0 ]; then
                # Move the file to printed directory
                mv "$PHOTO" "$PRINTED_DIR/"

                if [ $? -eq 0 ]; then
                    log_message "File moved to $PRINTED_DIR"
                    ((success_count++))
                else
                    log_message "Error moving file to $PRINTED_DIR" true
                fi
            fi
        else
            log_message "Error: Printing failed" true
        fi
    done

    log_message "Completed processing $success_count out of $num_files files"
    return 0
}

# If the script is being run directly (not sourced), execute with arguments
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    print-next-image "$@"
fi
