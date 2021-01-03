#!/bin/bash

MODE=$1

if [ "$MODE" = "DAY" ]; then
    # Change GTK Theme to Dark or Light
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'
    # Change the Alacritty theme
    $HOME/bin/alacritty-colorscheme  -t solarized_light.yaml
    # Change Backgrounds
    # Change Chromium theme
    # Change Firefox theme
    # Change Discord, Signal, Telegram, Other chats theme
    # Change Daedalus
fi

if [ "$MODE" = "NIGHT" ]; then
    # Change GTK Theme to Dark or Light
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
    # Change the Alacritty theme
    $HOME/bin/alacritty-colorscheme  -t custom.yaml
    # Change Backgrounds
    # Change Chromium theme
    # Change Firefox theme
    # Change Discord, Signal, Telegram, Other chats theme
    # Change Daedalus
fi



