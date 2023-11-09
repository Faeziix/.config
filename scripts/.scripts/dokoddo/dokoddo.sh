#!/bin/bash
# Path to your markdown file
file_path="./dokoddo.md"

# Path to the file that stores the index of the last quote that was read
index_path="./quote_index.txt"

# Path to the PDF file that contains the quotes
pdf_file="./dokoddo.pdf"

# Get the index of the last quote that was read
last_index=$(cat $index_path)

# Get the next quote in the list
next_index=$((last_index + 1))
next_quote=$(sed -n "${next_index}p" $file_path)

# If there are no more quotes in the list, start over from the beginning
if [ -z "$next_quote" ]; then
  next_index=1
  next_quote=$(sed -n "${next_index}p" $file_path)
fi

# Update the index file with the new index
echo $next_index > $index_path

notify-send --expire-time=0 \
           --icon=dialog-information \
           --app-name="Quote of the Day" \
           --action="zathura $pdf_file" \
           "Quote of the Day" "$next_quote"

# open pdf file in zathura
zathura $pdf_file
