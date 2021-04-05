#!bin/bash

# LavenRose First Boot Script 

sudo apt update
sudo apt upgrade

# Install Spotify
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.    d/spotify.list

# Download Discord
STLINK='https://discord.com/api/download?platform=linux&format=deb'
LINK=$(curl -ILs -o /dev/null -w %{url_effective} $STLINK)
wget -O discord.deb $LINK -q --show-progress

# Install Packages
sudo apt install spotify-client neovim ./discord.deb;
rm discord.deb

# NeoVim Setting up
mkdir .config/nvim; cd .config/nvim; cp ~/GHRepos/Conifgs/NeoVim/init.vim init.vim
ln -s ~/.config/nvim/init.vim ~/.vimrc

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Gnome-Terminal 
cd;
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git
cd nord-gnome-terminal/src
./nord.sh;

