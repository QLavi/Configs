#!/usr/bin/bash

function update() {
	sudo apt update && sudo apt upgrade
}

function os_setup() {
	gnome-extensions disable desktop-icons@csoriano
	gnome-extensions disable ubuntu-dock@ubuntu.com
}

function in_alacritty() {
	sudo add-apt-repository ppa:aslatter/ppa
	sudo apt update
	sudo apt install alacritty
	cd
	mkdir ~/.config/alacritty
	cp ~/Repos/Configs/Alacritty/alacritty.yml ~/.config/alacritty/
}

function in_popshell() {
	sudo apt install node-typescript
	cd
	mkdir Repos; cd Repos
	git clone https://github.com/pop-os/shell
	cd shell
	make local-install
}

function in_utils() {
	sudo apt install htop neofetch curl tree
}

function lang_utils() {
	sudo apt install g++ gcc make cmake
}

function in_editors() {
	sudo apt install neovim
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

	mkdir ~/.config/nvim
	cp ~/Repos/Configs/NeoVim/init.vim ~/.config/nvim/

	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
	sudo apt update
	sudo apt install sublime-text
}

function in_spotify_tools() {
	curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
	echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
	sudo apt update
	sudo apt install spotify-client gimp blender krita
}
function in_emacs() {
	sudo apt install emacs
	git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
	~/.emacs.d/bin/doom install
}
function in_JBToolbox() {
	cd
	cd Repos
	git clone https://github.com/nagygergo/jetbrains-toolbox-install
	cd jetbrains-toolbox-install
	./jetbrains-toolbox.sh
	cd ..
	rm -rf jetbrains-toolbox-install
}

function main() {
	update
	os_setup
	in_utils
	in_spotify_tools
	in_alacritty
	lang_utils
	in_editors
	in_emacs
	in_popshell

	in_JBToolbox
	sudo apt autoremove && sudo apt autoclean
}
main
