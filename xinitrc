# Update statusbar every second
while xsetroot -name " $STATUS"; do
    STATUS="$($HOME/.dotscripts/statusbar.sh)"
    sleep 1
done &

# Run profile
[[ -f "<dotfiles_dir>/.xprofile" ]] && . <dotfiles_dir>/.xprofile

# Launch dwm
exec dwm > $HOME/.logs/dwm.log
