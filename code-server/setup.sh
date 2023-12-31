#!/bin/bash

# install packages
sudo yum update -y
sudo yum install -y -q curl git wget vim
sudo yum clean all


# install nvm if not exist
if [ ! -d ~/.nvm ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
fi

# install node 16.6.1
. ~/.nvm/nvm.sh
nvm install --lts
nvm install 16.6.1

# create .vscode folder in home if not exist
if [ ! -d ~/.vscode ]; then
  mkdir ~/.vscode
fi
if [ ! -d ~/.vscode/extensions ]; then
  mkdir ~/.vscode/extensions
fi

# download vscode extensions list
echo "Downloading vscode settings and extensions list..."
curl https://raw.githubusercontent.com/rub1cc/.dotfiles/master/.vscode/settings.json > ~/.local/share/code-server/User/settings.json
curl https://raw.githubusercontent.com/rub1cc/.dotfiles/master/.vscode/extensions.txt -o ~/.vscode/extensions.txt

# install vscode extensions
echo "Installing vscode extensions..."
cd ~/.vscode
curl https://raw.githubusercontent.com/rub1cc/scripts/main/code-server/download-vsix.sh | bash
curl https://raw.githubusercontent.com/rub1cc/scripts/main/code-server/install-vsix.sh | bash
