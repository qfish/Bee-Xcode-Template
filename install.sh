#!/bin/bash

PACKAGE="template.tar.gz"
# TEMPLATE_PATH="$HOME/Users/QFish/Library/Developer/Xcode/Templates"
TEMPLATE_PATH="./temp/Templates"
TEMPLATE_FILE_PATH="$TEMPLATE_PATH/Project Templates/BeeFramework"
TEMPLATE_PROJECT_PATH="$TEMPLATE_PATH/File Templates/BeeFramework"

# if [ ! -d "$TEMPLATE_FILE_PATH" ]; then
#   sudo rm -rf "$TEMPLATE_FILE_PATH"
# fi

# if [ -d "$TEMPLATE_PROJECT_PATH" ]; then
#   sudo rm -rf "$TEMPLATE_PROJECT_PATH"
# fi

# status=$(sudo curl -o "$PACKAGE" $DOMAIN/XAlign/build/"$PACKAGE")
  # sudo wget $DOMAIN/XAlign/build/"$PACKAGE" -O "$PACKAGE"
sudo tar xzf "$PACKAGE" -C "$TEMPLATE_PATH"

# sudo rm -rf "$PACKAGE"