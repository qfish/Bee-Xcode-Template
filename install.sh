#!/bin/bash


# 定义变量
PACKAGE="bee.template.zip"
PACKAGE_URL="https://github.com/qfish/Bee-Xcode-Template/archive/master.zip"
# PACKAGE="master.zip"
TEMPLATE_PATH="$HOME/Library/Developer/Xcode/Templates"
# TEMPLATE_PATH="./t/Templates"
BEEFRAMEWORK="BeeFramework"
TEMPLATE_FILE="File Templates"
TEMPLATE_PROJECT="Project Templates"
TEMPLATE_FILE_PATH="$TEMPLATE_PATH/$TEMPLATE_FILE"
TEMPLATE_PROJECT_PATH="$TEMPLATE_PATH/$TEMPLATE_PROJECT"
SOURCE_TEMPLATE="Bee-Xcode-Template-master/Templates"
SOURCE_TEMPLATE_FILE="$SOURCE_TEMPLATE/$TEMPLATE_FILE/$BEEFRAMEWORK"
SOURCE_TEMPLATE_PROJECT="$SOURCE_TEMPLATE/$TEMPLATE_PROJECT/$BEEFRAMEWORK"

# # 如果已有，先删除上一个版本的
if [ -d "$TEMPLATE_FILE_PATH/$BEEFRAMEWORK" ]; then
  sudo rm -rf "$TEMPLATE_FILE_PATH/$BEEFRAMEWORK"
  echo "remove $TEMPLATE_FILE_PATH/$BEEFRAMEWORK"
fi

if [ -d "$TEMPLATE_PROJECT_PATH/$BEEFRAMEWORK" ]; then
  sudo rm -rf "$TEMPLATE_PROJECT_PATH/$BEEFRAMEWORK"
  echo "remove $TEMPLATE_PROJECT_PATH/$BEEFRAMEWORK"
fi

# # 从网络下载
if [[ ! -f "$PACKAGE" ]]; then
  status=$(sudo curl -L "$PACKAGE_URL" -o "$PACKAGE")
fi

# 解压
echo "unzip package ..."
sudo tar xzf "$PACKAGE"

# 复制
echo "copy templates ..."

if [[ ! -d "$TEMPLATE_FILE_PATH" ]]; then
  sudo mkdir -p "$TEMPLATE_FILE_PATH"
  echo "$TEMPLATE_FILE_PATH"
fi

sudo cp -rf "$SOURCE_TEMPLATE_FILE" "$TEMPLATE_FILE_PATH"

if [[ ! -d "$TEMPLATE_PROJECT_PATH" ]]; then
  sudo mkdir -p "$TEMPLATE_PROJECT_PATH"
  echo "$TEMPLATE_PROJECT_PATH"
fi

sudo cp -rf "$SOURCE_TEMPLATE_PROJECT" "$TEMPLATE_PROJECT_PATH"

# cleanup
# sudo rm -rf "$PACKAGE"
sudo rm -rf "Bee-Xcode-Template-master"

echo "
# Bee Xcode Template is installed to $TEMPLATE_PATH. 
# "
