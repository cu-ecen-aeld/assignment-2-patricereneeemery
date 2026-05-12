#!/bin/sh

# Check arguments
if [ $# -ne 2 ]; then
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

filesdir="$1"
searchstr="$2"

# Validate directory
if [ ! -d "$filesdir" ]; then
    echo "Error: Directory $filesdir does not exist"
    exit 1
fi

# Count files
filecount=$(find "$filesdir" -type f | wc -l)

# Count matching lines
matchcount=$(grep -R "$searchstr" "$filesdir" 2>/dev/null | wc -l)

echo "The number of files are $filecount and the number of matching lines are $matchcount"
exit 0
