#!/bin/bash

# Base URL (replace with your actual base URL, excluding "?page=N")
BASE_URL="$1"

# Output directory (optional)
#OUTPUT_DIR="pages"
#mkdir -p "$OUTPUT_DIR"

for N in $(seq 1 67); do
    URL="${BASE_URL}?page=${N}"
#    OUTPUT_FILE="${OUTPUT_DIR}/page_${N}.html"
#    echo "Fetching $URL -> $OUTPUT_FILE"
    #curl -s "$URL" -o "$OUTPUT_FILE"
    yt-dlp "$URL"
done

echo "All pages fetched."
#for f in *.mp4; do mv -- "$f" "${f%.mp4}.m4a"; done
