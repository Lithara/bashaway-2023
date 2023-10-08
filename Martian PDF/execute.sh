# Check if the src directory exists
if [ ! -d "src" ]; then
    echo "Error: The 'src' directory does not exist."
    exit 1
fi

# Check if the PDF file exists in the src directory
if [ ! -e "src/mystery.pdf" ]; then
    echo "Error: The 'mystery.pdf' file does not exist in the 'src' directory."
    exit 1
fi

# Check if a page number is provided as an argument
if [ $# -ne 1 ]; then
    echo "Usage: $0 <page_number>"
    exit 1
fi

# Extract the text from the specific page using pdftotext
pdftotext -f $1 -l $1 "src/mystery.pdf" - | tr -d '[:punct:]' | wc -w
