#!/bin/bash

# Configuration
PHOTO_DIR="${HOME}/Desktop/photos_to_print"
PRINTED_DIR="${PHOTO_DIR}/printed"
PRINTER="Canon_PRO_1100_series"
LOG_FILE="/tmp/photo_print.log"

# Function to send iMessage with attachment
send_imessage() {
    local message="$1"
    local attachment="$2"  # Optional attachment path
    local email="cycomachead@gmail.com"

    # If there's an attachment, create a compressed copy
    if [ -n "$attachment" ]; then
        local temp_dir="/tmp/print_photos"
        mkdir -p "$temp_dir"
        local compressed="${temp_dir}/$(basename "$attachment")"

        # Use sips to create a compressed copy (50% of original size)
        sips --resampleHeightWidth 1000 1000 \
             --setProperty formatOptions 70 \
             "$attachment" --out "$compressed" >/dev/null 2>&1

        # Get the absolute path for the attachment
        compressed=$(cd "$(dirname "$compressed")" && pwd)/$(basename "$compressed")

        # Send message with attachment
        osascript -e 'tell application "Messages"' \
                  -e "    send \"$message\" to buddy \"+19099933988\"" \
                  -e "    send POSIX file \"$compressed\" to buddy \"+19099933988\"" \
                  -e 'end tell'

        # Clean up temporary file
        sleep 56 && rm -f "$compressed"
    else
        # Send message only
        osascript -e 'tell application "Messages"' \
                  -e "    send \"$message\" to buddy \"cycomachead@gmail.com\"" \
                  -e 'end tell'
    fi
}

# Function to log messages and send notifications
log_message() {
    local message="$1"
    local is_error=${2:-false}

    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $message" | tee -a "$LOG_FILE"

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
        lp -d "$PRINTER" \
           -o media=4x6.FullBleed \
           -o CNIJPrintQuality=15 \
           -o CNIJAmountOfExtension=1 \
           -o CNIJPrintMode2=3 \
           -o CNIJPQualitySlider=4 \
           -o CNIJDisablePDEMarginAlert=1 \
           -o CNImageBrightnessSlider=10 \
           "$PHOTO"

        # Check if printing was successful
        if [ $? -eq 0 ]; then
            log_message "Print job submitted successfully"

            # Move the file to printed directory
            mv "$PHOTO" "$PRINTED_DIR/"

            if [ $? -eq 0 ]; then
                log_message "File moved to $PRINTED_DIR"
                ((success_count++))
                send_imessage "✅ Successfully printed and moved: $(basename "$PHOTO")" "$PHOTO"
            else
                log_message "Error moving file to $PRINTED_DIR" true
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
