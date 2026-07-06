#!/bin/bash

echo "Enter the directory name:"
read dirname

if [ -d "$dirname" ]; then
    echo "Directory '$dirname' already exists."
else
    mkdir "$dirname"
    echo "Directory '$dirname' has been created."
fi
