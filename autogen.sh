[ ! -d "$1" ] && echo "Not a valid directory: '$d'" && exit

echo -n "Compiling '$1'..."

sassc "$1/cinnamon.scss" > "$1/cinnamon.css"
# sassc "$1/gnome-shell.scss" > "$1/gnome-shell.css"

echo "done"
