
# Define the path to the text file
text_file="src/your_secret_text.txt"

# Check if the file exists
if [ -f "$text_file" ]; then
    # Set read-only permissions on the file
    chmod 444 "$text_file"
    echo "The text file is now read-only."
else
    echo "The text file does not exist in the src directory."
fi
