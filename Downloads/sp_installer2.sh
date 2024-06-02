#!/bin/bash

white=`echo -en "\033[m"`
blue=`echo -en "\033[36m"`
cyan=`echo -en "\033[1;36m"`
yellow=`echo -en "\033[1;33m"`

function title() {
  local text=$1
  local color=$2
  local max_length=62
  local text_length=${#text}
  local padding_left=$(((max_length - text_length) / 2))
  local padding_right=$((max_length - text_length - padding_left))
  printf " │%*s${color}%s${white}%*s│\n" $padding_left '' "$text" $padding_right ''
}

function action() {
  local text=$1
  local color=$2
  printf "\n\n ${yellow}• ${color}%s •${white}\n\n" "$text"
}

clear

echo -e "${white}"
echo -e " ┌──────────────────────────────────────────────────────────────┐"
title "• SPEEDER PAD INSTALLER •" "${blue}"
title "Copyright © Cyril Guislain (Guilouz)" "${white}"
echo -e " └──────────────────────────────────────────────────────────────┘"

action "INSTALLING UPDATED PYTHON3 VERSION" "${yellow}"
apt install python3.9 -y
update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
echo
echo -e "${cyan} INFO: Install done!${white}"

action "INSTALLING PYTHON3 VENV" "${yellow}"
apt install python3.9-venv python3.9-dev -y
echo
echo -e "${cyan} INFO: Install done!${white}"

action "INSTALLING UPDATED PIP VERSION" "${yellow}"
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
echo
python3 get-pip.py
echo
yes | python3 -m pip install testresources
rm -f get-pip.py
echo
echo -e "${cyan} INFO: Install done!${white}"

action "INSTALLING UPDATED VIRTUALENV" "${yellow}"
yes | pip3 uninstall virtualenv
echo
yes | pip3 install virtualenv
echo
echo -e "${cyan} INFO: Install done!${white}"

action "INSTALLING KIAUH" "${yellow}"
if [ -d /home/pi/kiauh ]; then
    rm -rf /home/pi/kiauh
fi
git clone https://github.com/th33xitus/kiauh.git
echo
echo -e "${cyan} INFO: Install done!${white}"

action "REMOVING STOCK CONFIGURATION FILES" "${yellow}"
rm -rf /home/pi/.moonraker_database_1
rm -rf /home/pi/.moonraker_database_2
rm -rf /home/pi/.moonraker_database_3
rm -rf /home/pi/klipper_config
rm -rf /home/pi/klipper_logs
rm -rf /home/pi/.cache
rm -rf /home/pi/.gnupg
rm -rf /home/pi/.local
rm -rf /home/pi/.config
rm -rf /home/pi/.dbus
rm -rf /home/pi/.gitconfig
rm -rf /home/pi/moonraker-timelapse
rm -f /home/pi/savedVariables1.cfg
rm -f /home/pi/savedVariables2.cfg
rm -f /home/pi/savedVariables3.cfg
rm -f /home/pi/sp_installer2.sh
echo -e "${cyan} INFO: Removing done!"
echo

exit 0