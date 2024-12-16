#!/bin/bash

# Check if GITHUB_TOKEN is set
if [ -z "$GITHUB_TOKEN" ]; then
    echo "Error: GITHUB_TOKEN is not set. Exiting."
    exit 1
fi

# Ensure the binary exists
if [ ! -f "/app/output-binary-arm" ]; then
    echo "Error: No binary found. Please build the binary first."
    exit 1
fi

# Create a release and upload the binary
echo "Uploading binary to GitHub..."
gh release create v1.0 /app/output-binary-arm --title "Raspberry Pi Binary" --notes "Binary compiled for Raspberry Pi ARM architecture."
