#!/usr/bin/bash 

function update() {
	sudo apt update && sudo apt upgrade
}

function os_setup() {
	gnome-extensions disable desktop-icons@csoriano
	gnome-extensions disable ubuntu-dock@ubuntu.com
}

function in_utils() {
	sudo apt install htop neofetch curl git;
}

function lang_utils() {
	sudo apt install g++ gcc make;
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
}

function in_editors() {
	sudo apt install vim;
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -;
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list;
	sudo apt install sublime-text;
}

function in_spotify_discord() {
	curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -;
	echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list;
	sudo apt install spotify-client discord;
}

function in_JBToolbox() {
	cd;
	mkdir Repos;
	cd Repos;
	git clone https://github.com/nagygergo/jetbrains-toolbox-install.git;
	cd jetbrains-toolbox-install;
	./jetbrains-toolbox.sh;
	cd ..;
	rm -rf jetbrains-toolbox-install
}

function main() {
	update;
	os_setup;
	in_spotify;

	in_utils;
	lang_utils;
	in_editors;
	set_aliases;

	in_JBToolbox;
	sudo apt autoremove && sudo apt autoclean;
}

main
