# Create a temporary directory
temp_dir=$(mktemp -d)

# Copy the Pascal-like script from the src directory to the temporary directory
cp src/script.pascal $temp_dir/script.pascal

# Change to the temporary directory
cd $temp_dir

# Execute the Pascal-like script
./script.pascal > output.txt 2>&1

# Capture the output in a file
output=$(cat output.txt)

# Display the output to the console
echo "$output"

# Clean up the temporary directory
rm -r $temp_dir