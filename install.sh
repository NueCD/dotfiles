#!/bin/sh

[ ! -d "$(pwd)/../dotfiles" ] && echo "The dotfiles directory is not where we expect." && \
    printf "Enter path to directory where dotfiles is located [$(pwd)]: " && read SRC || SRC="$(pwd)"

# Find what os we are running.
OS="$(uname)"

# Prepare directory.
cd $SRC
[ ! -d "dotfiles" ] && echo "No dotfiles directory found. Exiting." && exit
mv dotfiles .dotfiles
SRC="$(pwd)/.dotfiles"

# Go through all files and install each of them. Some files are only used in terminal and do not need linking.
ln -s $SRC/bashrc $HOME/.bashrc
ln -s $SRC/bash_profile $HOME/.bash_profile
ln -s $SRC/vimrc $HOME/.vimrc
ln -s $SRC/xinitrc $HOME/.xinitrc

sed -i "s/<dotfiles_dir>/$SRC/g" $SRC/xinitrc
sed -i "s/<dotfiles_dir>/$SRC/g" $SRC/bashrc
printf "Enter computer name for command line [$(hostname)]: "
read H || H="$(hostname)"
sed -i "s/<dotfiles_dir>/$H/g" $SRC/bashrc
[ "$OS" == "OpenBSD" ] && sed -i 's/<pm>/doas pkg/g' $SRC/aliases
[ "$OS" == "Linux" ] && [ "$(cat /etc/*-release | grep DISTRIB_ID | awk -F'=' '{print $2}'") == "Arch" ] && \
    sed -i 's/<pm>/sudo pacman/g' $SRC/aliases
