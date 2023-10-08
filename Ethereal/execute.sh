# etherealbinarybeast command will be available once the tests are run

# Check if etherealbinarybeast exists
if ! command -v etherealbinarybeast &>/dev/null; then
  echo "The command 'etherealbinarybeast' does not exist."
  echo "You must establish the command before using 'ethereal'."
  exit 1
fi

# Create an alias for 'ethereal' to execute 'etherealbinarybeast'
alias ethereal='etherealbinarybeast'

# Inform the user about the ethereal shortcut
echo "The 'ethereal' shortcut has been created and invokes 'etherealbinarybeast'."

# Run 'etherealbinarybeast' when 'ethereal' is invoked
ethereal