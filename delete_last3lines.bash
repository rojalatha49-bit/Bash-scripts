#!/bin/bash

echo "Enter the file name:"
read filename

if [ -f "$filename" ]
then
    total_lines=$(wc -l < "$filename")

    if [ "$total_lines" -gt 3 ]
    then
        head -n -3 "$filename" > temp.txt
        mv temp.txt "$filename"
        echo "Last 3 lines deleted successfully."
    else
        echo "The file has 3 or fewer lines. Cannot delete the last 3 lines."
    fi
else
    echo "File does not exist."
fi
