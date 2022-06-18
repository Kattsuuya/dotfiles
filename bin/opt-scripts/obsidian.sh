#!/usr/bin/env bash
TEMP_FILE="$(mktemp).deb"
curl -L -o $TEMP_FILE https://github.com/obsidianmd/obsidian-releases/releases/download/v0.14.15/obsidian_0.14.15_amd64.deb
sudo apt install $TEMP_FILE
rm -f $TEMP_FILE
