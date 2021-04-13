#!/usr/bin/bash

# LavenRose First Boot Script 

function down_discord() {
	cd ~/Downloads
	STLINK='https://discord.com/api/download?platform=linux&format=deb'
	LINK=$( curl -ILs -o /dev/null -w %{url_effective} $STLINK )
	wget -O discord.deb $LINK -q --show-progress
}

function down_spotify() {
	curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add -
	echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
}

function down_sublime_text() {
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
}

function setup() {
	sudo apt update
	sudo apt upgrade

	down_discord
	neovim_setup

	sudo apt update

	sudo apt install spotify-client ./Downloads/discord.deb sublime-text
}

setup

