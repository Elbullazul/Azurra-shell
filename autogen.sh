[ ! -d "$1" ] && echo "Not a valid directory: '$1'" && exit

echo -n "Compiling '$1'..."

sassc "$1/cinnamon.scss" > "$1/cinnamon.css"
# sassc "$1/gnome-shell.scss" > "$1/gnome-shell.css"

if [ -f "$1/cinnamon-dark.scss" ]; then
  sassc "$1/cinnamon-dark.scss" > "$1/cinnamon-dark.css"
fi

# load theme config file
. "$1/theme.rc"

# copy files
if [ ! -z $CINNAMON_DIR ]; then
  cp -r "$1/"*.css "$CINNAMON_DIR"
  cp -r "$1/assets/"* "$CINNAMON_DIR/assets"
fi

if [ -f "$1/cinnamon-dark.css" ] && [ ! -z $CINNAMON_DARK_DIR ]; then
  cp -r "$1/cinnamon-dark.css" "$CINNAMON_DARK_DIR/cinnamon.css"
  cp -r "$1/assets-dark/"* "$CINNAMON_DARK_DIR/assets"
fi

echo "done"
