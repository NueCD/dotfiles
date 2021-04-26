# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f "<dotfiles_dir>/aliases" ]] && . <dotfiles_dir>/aliases

# Variables
PATH=$PATH:$HOME/.local/bin:$HOME/.dotscripts
CC=gcc
PS1="\[\e[35m\]<hostname> \[\e[36m\]\w \[\e[33m\]--> \[\e[m\]"
