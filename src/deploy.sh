#!/bin/bash

# Variables
CICD_PATH="/home/devops/aap-iaas-cicd"
SRC_PATH="$CICD_PATH/src"
CONF_FILE="$SRC_PATH/deploy.conf"
ORG_FILE="$SRC_PATH/html/index.html"
TMP_FILE="/tmp/index.html.tmp"
WWW_FILE="/var/www/html/index.html"

# Update Source Code && Load Config Variable
cd $CICD_PATH && git pull
source $CONF_FILE

# Build New "index.html" via Config Variable
sudo cp $ORG_FILE $TMP_FILE
sudo sed -i "s/__HEAD_TITLE__/$HEAD_TITLE/g" $TMP_FILE
sudo sed -i "s/__BODY_COMPANY__/$BODY_COMPANY/g" $TMP_FILE
sudo sed -i "s/__BODY_VERSION__/$BODY_VERSION/g" $TMP_FILE
sudo sed -i "s/__HOSTNAME__/$(hostname)/g" $TMP_FILE
sudo mv $TMP_FILE $WWW_FILE
