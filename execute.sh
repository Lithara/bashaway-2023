# A random count of csv files will be generated within the src directory once the tests are run.

# Write your code here

#!/bin/bash

# Define the input and output directories
input_dir="src"
output_dir="out"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

# Debugging: Print a message to indicate script execution
echo "Script is starting..."

# Initialize an array to store all the scroll file paths
scroll_files=()

# Loop through the input directory and collect all CSV files
for file in "$input_dir"/*.csv; do
  [ -e "$file" ] || continue  # Check if the file exists
  scroll_files+=("$file")
done

# Check if there are any scroll files to process
if [ ${#scroll_files[@]} -eq 0 ]; then
  echo "No scroll files found in $input_dir."
  exit 1
fi

# Debugging: Print the list of scroll files
echo "Scroll files to process:"
for scroll in "${scroll_files[@]}"; do
  echo "$scroll"
done

# ... (rest of the script)

# Debugging: Print a message when the script is done
echo "Script finished successfully."

# Exit with a success code
exit 0

