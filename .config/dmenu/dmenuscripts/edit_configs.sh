#!/bin/bash

FILES="qtile\nkitty\nzsh\nranger\nnvim\nedit_configs\ndmenu\nst"
MENU=$(echo -e "$FILES" | dmenu -l 15 -i -p "Edit:")

case "$MENU" in
	qtile) kitty -e nvim ~/.config/qtile/config.py ;;
	kitty) kitty -e nvim ~/.config/kitty/kitty.conf ;;
	zsh) kitty -e nvim ~/.zshrc ;;
	ranger) kitty -e nvim ~/.config/ranger/rc.conf ;;
	nvim) kitty -e nvim ~/.config/nvim/init.vim ;;
	edit_configs) kitty -e nvim ~/.config/dmenu/dmenuscripts/edit_configs.sh ;;
	dmenu) kitty -e nvim ~/.config/dmenu/config.h ;;
	kitty) kitty -e nvim ~/.config/kitty/config.h ;;
esac
