#!/usr/bin/env bash

. "$DOTPATH/bin/install.sh"

# Add VSCode repository
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

# Install VSCode
sudo apt install -y code

# Make Symbolic link
ln -sf $HOME/.dotfiles/settings.json $HOME/.config/Code/User/settings.json

# Install VSCode extensions
cat "$DOTPATH/data/extensions" | while read line
do
    code --install-extension $line
done
code --list-extensions > "$DOTPATH/data/extensions"
