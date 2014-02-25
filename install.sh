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

# 如果已有，先删除上一个版本的
if [ -d "$TEMPLATE_FILE_PATH/$BEEFRAMEWORK" ]; then
  sudo rm -rf "$TEMPLATE_FILE_PATH/$BEEFRAMEWORK"
  echo "remove $TEMPLATE_FILE_PATH/$BEEFRAMEWORK"
fi

if [ -d "$TEMPLATE_PROJECT_PATH/$BEEFRAMEWORK" ]; then
  sudo rm -rf "$TEMPLATE_PROJECT_PATH/$BEEFRAMEWORK"
  echo "remove $TEMPLATE_PROJECT_PATH/$BEEFRAMEWORK"
fi

echo "
//
//   ______    ______    ______
//  /\\  __ \\  /\\  ___\\  /\\  ___\\
//  \\ \\  __<  \\ \\  __\\_ \\ \\  __\\_
//   \\ \\_____\\ \\ \\_____\\ \\ \\_____\\
//    \\/_____/  \\/_____/  \\/_____/
//
//
//  Copyright (c) 2013-2014, {Bee} open source community
//  http://www.bee-framework.com
//
//
//    Xcode Template For BeeFramework
//"

# # 复制
if [[ ! -d "$TEMPLATE_FILE_PATH" ]]; then
  sudo mkdir -p "$TEMPLATE_FILE_PATH"
  echo "mkdir $TEMPLATE_FILE_PATH"
fi

sudo cp -rf "$SOURCE_TEMPLATE_FILE" "$TEMPLATE_FILE_PATH"

if [[ ! -d "$TEMPLATE_PROJECT_PATH" ]]; then
  sudo mkdir -p "$TEMPLATE_PROJECT_PATH"
  echo "mkdir $TEMPLATE_PROJECT_PATH"
fi

echo $(sudo cp -rf "$SOURCE_TEMPLATE_PROJECT" "$TEMPLATE_PROJECT_PATH") 2>&1

# # cleanup

echo "# Bee Xcode Template is installed to $TEMPLATE_PATH."
