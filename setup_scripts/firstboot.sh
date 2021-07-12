#! /usr/bin/bash

function update()
{
	sudo apt update
	sudo apt upgrade
}

function keyb_setup()
{
	gsettings set org.gnome.desktop.input-sources xkb-options "['caps:swapescape']"
}

function install_utils()
{
	sudo apt install tree htop cmake gdb valgrind
}

function neovim()
{
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

	mkdir ~/.config/nvim
	cp ../neovim/init.vim ~/.config/nvim/
	ln -s ~/.config/nvim/init.vim .vimrc
}

function alacritty()
{
	sudo apt install alacritty
	mkdir ~/.config/alacritty
	cp ../alacritty/alacritty.yml ~/.config/alacritty/
}

function ssh_setup()
{
	ssh-keygen -t ed25519 -C "LavenRose@protonmail.com"
	eval "${ssh-agent -s}"
	ssh-add ~/.ssh/id_ed25519
}

function git_setup()
{
	sudo add-apt-repository ppa:git-core/ppa
	update
	git config --global user.name "QLavi"
	git config --global user.email "LavenRose@protonmail.com"
	git config --global init.defaultBranch "main"
}

function main()
{
	update
	keyb_setup
	install_utils
	alacritty
	neovim
	ssh_setup
	git_setup
}
main
