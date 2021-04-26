# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f "$HOME/.config/aliases" ]] && . $HOME/.config/aliases

# Variables
PATH=$PATH:$HOME/.local/bin:$HOME/.scripts
CC=gcc
PS1="\[\e[35m\]Amatsukaze \[\e[36m\]\w \[\e[33m\]--> \[\e[m\]"
