#!/bin/bash

if [ -z "$1" ]; then
    echo "Please provide a URL to a font zip file"
    exit 1
fi

TEMP_DIR=$(mktemp -d)

wget -O "$TEMP_DIR/font.zip" "$1"

unzip "$TEMP_DIR/font.zip" -d "$TEMP_DIR"

sudo mv "$TEMP_DIR"/*.{ttf,otf} /usr/local/share/fonts/

fc-cache -f -v

rm -rf "$TEMP_DIR"

echo "Font installed"
