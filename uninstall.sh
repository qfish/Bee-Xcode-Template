#!/bin/bash

BEEFRAMEWORK="BeeFramework"

TEMPLATE_PATH="$HOME/Library/Developer/Xcode/Templates"

SOURCE_TEMPLATE="./Templates"

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
if [[ ! -d "$TEMPLATE_PATH" ]]; then
  sudo mkdir -p "$TEMPLATE_PATH"
  echo "[mkdir] $TEMPLATE_PATH"
fi

# 如果已有，先删除上一个版本的

sudo find "$TEMPLATE_PATH" -type d -name "*$BEEFRAMEWORK*" > ".deleles"

while read line; do
  echo "[Removed]   $line"
  sudo rm -rf "$line";
done < ".deleles"

sudo rm -rf ".deleles"

echo "
\\033[31mBee Xcode Template has been uninstalled.

\\033[34mHave a Nice Day ~\\033[0m
"
