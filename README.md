# Minimal-Xmonad
Minimal Xmonad configuration without xmobar. This repo contains a bunch of gtk themes, themes for icons and mouse cursor theme. This config works with xmonad version 0.14.
Dependencies:
Must have:
`xdotool` (for clickable workspaces in xmobar)

Xmonad is a tiling window manager for X. Windows are arranged automatically to tile the screen without gaps or overlap, maximising screen use. Window manager features are accessible from the keyboard: a mouse is optional. xmonad is written, configured and extensible in Haskell. Custom layout algorithms, key bindings and other extensions may be written by the user in config files. Layouts are applied dynamically, and different layouts may be used on each workspace. Xinerama is fully supported, allowing windows to be tiled on several physical screens.

This directory houses my personal xmonad configuration (xmonad.hs). To check out my config, you will need to have xmonad, xmonad-contrib and xmobar installed. Then you need to place the xmonad.hs file in ~/.xmonad or in ~/.config/xmonad/. Then recompile xmonad and restart xmonad.

All Xmonad configuration is in ~/.xmonad/xmonad.hs. This includes things like key bindings, colors, layouts, etc. You may need to have some basic understanding of Haskell in order to modify this file, but most people have no problems. Configuration file for xmobar is ~/.xmobarrs. Xmobar is configured to show date and time, cpu usage, disk usage (root dir), net activity, mpd info (curent playing song). This comes with nice bars (thanks for xmobar developer).




Screenshots

![Screenshot](screen.png?raw=true "Bussy")
![Screenshot](screen_1.png?raw=true "Bussy")
![Screenshot](screen_2.png?raw=true "Bussy")
![Screenshot](screen_3.png?raw=true "Bussy")




