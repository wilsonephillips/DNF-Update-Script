#!/usr/bin/bash

# File location /home/username/.local/bin/update.sh
# and can be called from the ~/.bash_aliases or ~/.bashrc file with this alias command
# alias dsync="~/.local/bin/update.sh" # dnf updates for OpenMandriva with log file
# Make sure it is executable!
#
echo # This just adds blank line to separate these headers.
echo -e "\033[0;31m╔════════════════════════════════╗\033[0m" # Red for root.
echo -e "\033[0;31m║**Updating all System packages**║\033[0m" # Red for root.
echo -e "\033[0;31m╚════════════════════════════════╝\033[0m" # Red for root.
echo
sudo dnf clean all ; dnf clean all ; sudo dnf distro-sync --refresh --allowerasing 2>&1| tee dsync2-log.txt
echo
echo -e "\033[0;33m╔══════════════════════════════════╗\033[0m" # Yellow for user
echo -e "\033[0;33m║**Updating Flatpaks from FlatHub**║\033[0m" # Yellow for user
echo -e "\033[0;33m╚══════════════════════════════════╝\033[0m" # Yellow for user
echo
flatpak update -y # Flatpaks are not installed as root. Remove -y if you don't want to assume yes.
echo
echo -e "\033[0;32m╔═════════════════════╗\033[0m" # Green for complete
echo -e "\033[0;32m║**Script Completed!**║\033[0m" # Green for complete
echo -e "\033[0;32m╚═════════════════════╝\033[0m" # Green for complete
echo

# There are some special characters used to make the boxes.
# ┌ ┐ └ ┘ ┏ ┓ ┗ ┛ ╔ ╗ ╚ ╝ ─ ━ ═ │ ┃ ║ ├ ┤ ┣ ┫ ╟ ╢ ╠ ╣
#
# Color References placed here for your convenience
# Reset
# \e[0;0m | NoColor
#
# Regular Colors
# Value    | Color
# -------- | ------
# \e[0;30m | Black
# \e[0;31m | Red
# \e[0;32m | Green
# \e[0;33m | Yellow
# \e[0;34m | Blue
# \e[0;35m | Purple
# \e[0;36m | Cyan
# \e[0;37m | White
#
# Bold Text Colors
# Value    | Color
# -------- | ------
# \e[1;30m | Bright Black
# \e[1;31m | Bright Red
# \e[1;32m | Bright Green
# \e[1;33m | Bright Yellow
# \e[1;34m | Bright Blue
# \e[1;35m | Bright Purple
# \e[1;36m | Bright Cyan
# \e[1;37m | Bright White

# Tip: Make sure Kate is using the same monospace font as your terminal
# 
# Special characters can be found with
# `sudo dnf install plasma6-kcharselect --refresh'
# They were under "common"
#
# https://forum.openmandriva.org/t/rice-for-the-sake-of-rice-in-an-update-script/7454
#
# Play with this and see what you can do. The terminal is nothing to fear.
#
# echo -e  prints the line to the screen
#     |      sets the color                 sets the color
#     |      |      color                    |    color
#     |      |      |                        |    |
# echo -e "\033[0;31m╔═════════════════════╗\033[0m" 
#               |
#              not bold
# 0=not bold or regular
# 1=bold or bright
#
# The terminal does not do Bold text. It uses Bold to set the Bright colors
#
