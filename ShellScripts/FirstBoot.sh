#!/usr/bin/bash

# LavenRose First Boot Script 

function down_discord() {
	cd ~/Downloads
	STLINK='https://discord.com/api/download?platform=linux&format=deb'
	LINK=$( curl -ILs -o /dev/null -w %{url_effective} $STLINK )
	wget -O discord.deb $LINK -q --show-progress
}

function neovim_setup(){
	cd
	mkdir .config/nvim
	cp Repos/Configs/NeoVim/init.vim .config/nvim/init.vim
	ln -s .config/nvim/init.vim .vimrc

	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

function nord_theme() {
	cd Repos
	git clone https://github.com/arcticicestudio/nord-gnome-terminal.git
	cd nord-gnome-terminal/src
	./nord.sh
}

function install_pkgs() {
	sudo apt update
	sudo apt upgrade

	down_discord
	neovim_setup

	sudo apt install spotify-client neovim ./Downloads/discord.deb

	nord_theme
}



