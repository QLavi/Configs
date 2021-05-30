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
	sudo add-apt-repository ppa:git-core/ppa
	sudo apt update
	sudo apt install htop neofetch curl tree
}

function lang_utils() {
	sudo apt install g++ gcc make cmake clang libclang-dev gdb valgrind
}

function in_editors() {
	sudo apt install neovim
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

	mkdir ~/.config/nvim
	cp ~/Repos/Configs/NeoVim/init.vim ~/.config/nvim/
	ln -s ~/.config/nvim/init.vim ~/.vimrc

	sudo add-apt-repository ppa:kelleyk/emacs
	sudo apt update
	sudo apt install emacs27
	git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
	~/.emacs.d/bin/doom install

	cp ~/Repos/Configs/Doom_Emacs/* ~/.doom.d/
}

function in_tools() {
	sudo apt install gimp blender krita
}

function main() {
	update
	os_setup
	in_utils
	in_tools
	in_alacritty
	lang_utils
	in_editors
	in_popshell

	sudo apt autoremove && sudo apt autoclean
}
main
