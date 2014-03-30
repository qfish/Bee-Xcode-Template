#!/bin/bash

BEEFRAMEWORK="BeeFramework"

TEMPLATE_PATH="$HOME/Library/Developer/Xcode/Templates"
TEMPLATE_FILE="File Templates"
TEMPLATE_PROJECT="Project Templates"
TEMPLATE_FILE_PATH="$TEMPLATE_PATH/$TEMPLATE_FILE"
TEMPLATE_PROJECT_PATH="$TEMPLATE_PATH/$TEMPLATE_PROJECT"

SOURCE_TEMPLATE="./Templates"
SOURCE_TEMPLATE_FILE="$SOURCE_TEMPLATE/$TEMPLATE_FILE/$BEEFRAMEWORK"
SOURCE_TEMPLATE_PROJECT="$SOURCE_TEMPLATE/$TEMPLATE_PROJECT/$BEEFRAMEWORK"

echo "
   ______    ______    ______
  /\\  __ \\  /\\  ___\\  /\\  ___\\
  \\ \\  __<  \\ \\  __\\_ \\ \\  __\\_
   \\ \\_____\\ \\ \\_____\\ \\ \\_____\\
    \\/_____/  \\/_____/  \\/_____/


  Copyright (c) 2013-2014, {Bee} open source community
  \\033[4mhttp://www.bee-framework.com\\033[0m


  Xcode Template For BeeFramework BY QFish 
  \\033[4mhttp://QFi.sh\\033[0m

=======================================================
"

# 如果已有，先删除上一个版本的
if [ -d "$TEMPLATE_FILE_PATH/$BEEFRAMEWORK" ]; then
  sudo rm -rf "$TEMPLATE_FILE_PATH/$BEEFRAMEWORK"
  echo "[remove] $TEMPLATE_FILE_PATH/$BEEFRAMEWORK"
fi

if [ -d "$TEMPLATE_PROJECT_PATH/$BEEFRAMEWORK" ]; then
  sudo rm -rf "$TEMPLATE_PROJECT_PATH/$BEEFRAMEWORK"
  echo "[remove] $TEMPLATE_PROJECT_PATH/$BEEFRAMEWORK"
fi

# # 复制
if [[ ! -d "$TEMPLATE_FILE_PATH" ]]; then
  sudo mkdir -p "$TEMPLATE_FILE_PATH"
  echo "[mkdir] $TEMPLATE_FILE_PATH"
fi

sudo cp -rf "$SOURCE_TEMPLATE_FILE" "$TEMPLATE_FILE_PATH"
sudo find "$TEMPLATE_FILE_PATH" -name ".gitignore" -depth -exec rm {} \;

if [[ ! -d "$TEMPLATE_PROJECT_PATH" ]]; then
  sudo mkdir -p "$TEMPLATE_PROJECT_PATH"
  echo "[mkdir] $TEMPLATE_PROJECT_PATH"
fi

sudo cp -rf "$SOURCE_TEMPLATE_PROJECT" "$TEMPLATE_PROJECT_PATH"
sudo find "$TEMPLATE_PROJECT_PATH" -name ".gitignore" -depth -exec rm {} \;

# # cleanup

echo "[copy to] $TEMPLATE_PATH."

echo "\n\\033[31mBee Xcode Template has been installed.\\033[0m\n"
