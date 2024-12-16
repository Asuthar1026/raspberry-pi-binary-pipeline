#!/bin/bash

# Set cross-compilation environment variables
export CC=arm-linux-gnueabihf-gcc
export CXX=arm-linux-gnueabihf-g++

# Compile the binary
echo "Compiling for Raspberry Pi..."
$CC /app/src/main.c -o /app/output-binary-arm

# Check if the binary exists
if [ -f "/app/output-binary-arm" ]; then
    echo "Compilation successful. Binary saved as '/app/output-binary-arm'."
else
    echo "Error: Compilation failed. No binary was created."
    exit 1
fi

# Check the current directory and list files for debugging
echo "Current directory inside container: $(pwd)"
echo "Listing contents of /app:"
ls -l /app
