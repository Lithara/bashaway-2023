# A random count of csv files will be generated within the src directory once the tests are run.

# Write your code here

# Define the input and output directories
input_dir="src"
output_dir="out"

# Create the output directory if it doesn't exist
mkdir -p "$output_dir"

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

# Initialize an empty array to store converted values
converted_values=()

# Loop through each scroll file and process its content
for scroll in "${scroll_files[@]}"; do
  # Read the header to check the currency and skip it
  read -r header < "$scroll"

  # Convert Gold Drakes to Silver Sovereigns and store the result
  while IFS=, read -r item value; do
    # Check if the value is a valid number
    if [[ "$value" =~ ^[0-9]*(\.[0-9]*)?$ ]]; then
      # Perform the conversion and round to 2 decimal places
      converted_value=$(echo "scale=2; $value * 178" | bc)
      converted_values+=("$converted_value")
    fi
  done < <(tail -n +2 "$scroll")
done

# Sort the converted values in descending order
IFS=$'\n' sorted_values=($(sort -rn <<<"${converted_values[*]}"))
unset IFS

# Create the merged-scrolls.csv file with Silver Sovereigns header
echo "Item,Silver Sovereigns" > "$output_dir/merged-scrolls.csv"

# Add the sorted and converted values to the merged file
for value in "${sorted_values[@]}"; do
  echo ",$value" >> "$output_dir/merged-scrolls.csv"
done

echo "Merged and converted scrolls saved to $output_dir/merged-scrolls.csv"
