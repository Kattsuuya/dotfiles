#!/usr/bin/env bash
sudo apt install -y rbenv
rbenv init
bash -c "$(curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor)"
