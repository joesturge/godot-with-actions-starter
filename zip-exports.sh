#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 <directory> <zip_file>"
    exit 1
fi

dir="$1"
zip_file="$2"
pwd=$(pwd)

# Navigate to the specified directoryy
cd "$dir" || exit 1


# Loop through each subdirectory
for subdir in */; do
    # Navigate into the subdirectory
    cd "$subdir" || continue

    # Create a zip file for the subdirectory
    zip -rm "${subdir%/}.zip" .

    # Navigate back to the parent directory
    cd ..
done


# Zip all the zips under the directory
zip -rjm "$zip_file" ./


# Move zip file to the original directory
mv "$zip_file" "$pwd"
cd "$pwd"

# Remove dir
rm -rf "$dir"