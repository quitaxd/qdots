#!/usr/bin/env bash

# Set .config dir
echo "What is your config directory? [$HOME/.config]"
read confdir

if [ "$confdir" = "" ]; then
	confdir=$HOME/.config
fi

# Set repo
echo "Enter your Git repo. You can use ssh or https. "
read gitrepo

# Clone the repo
mkdir -p $HOME/.dots
git clone $gitrepo ~/.dots

# Copy the binaries
cp bin/* ~/.local/bin

# Check bin folder.

if echo $PATH | grep .local >/dev/null; then
	echo "OK."
else
	echo "You should add ~/.local/bin to your path."
fi
