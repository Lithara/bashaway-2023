#!/bin/bash

# Check if the required tool 'python3' is installed.
if ! command -v python3 &> /dev/null
then
    echo "Python3 is not installed. Please install it."
    exit 1
fi

# Check if 'http.server' module is available.
if ! python3 -m http.server --help &> /dev/null
then
    echo "The 'http.server' module is not available. Please check your Python installation."
    exit 1
fi

# Change to the directory containing your HTML file (replace with the actual directory).
cd /path/to/your/html/file/directory

# Start a Python HTTP server on port 8085.
python3 -m http.server 8085
