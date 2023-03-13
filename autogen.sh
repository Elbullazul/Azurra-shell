[ ! -d "$1" ] && echo "Not a valid directory: '$1'" && exit

echo -n "Compiling '$1'..."

sassc "$1/cinnamon.scss" > "$1/cinnamon.css"
# sassc "$1/gnome-shell.scss" > "$1/gnome-shell.css"

if [ -f "$1/cinnamon-dark.scss" ]; then
  sassc "$1/cinnamon-dark.scss" > "$1/cinnamon-dark.css"
fi

echo "done"
