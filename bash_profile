#
# ~/.bash_profile
#

# Gnome stuff
#export XDG_CURRENT_DESKTOP=GNOME-Classic:GNOME
#export GNOME_SHELL_SESSION_MODE=classic
export XDG_SESSION_TYPE=x11
export GDK_BACKEND=x11
[[ -z "$DISPLAY" && "$(tty)" == "/dev/tty1" ]]  && exec startx

# Sway stuff
if [ "$(tty)" == "/dev/tty2" ]; then
    export GTK_IM_MODULE='uim' 
    export QT_IM_MODULE='uim' 
    export XMODIFIERS='@im=uim'
    exec sway
    #uim-xim &
fi

# if not gnome
[ -f "~/.bashrc" ] && . ~/.bashrc
