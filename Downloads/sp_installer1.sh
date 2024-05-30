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

action "UPDATE PACKAGES LIST" "${yellow}"
apt update
echo
echo -e "${cyan} INFO: Update done!${white}"

action "INSTALL OUTDATED PACKAGES" "${yellow}"
apt full-upgrade -y
echo
echo -e "${cyan} INFO: Install done!${white}"

action "ADDING ALTERNATIVE REPOSITORY" "${yellow}"
apt install software-properties-common -y
echo
yes | add-apt-repository ppa:deadsnakes/ppa
echo
echo -e "${cyan} INFO: Install done!${white}"

action "INSTALLING NEEDED PACKAGES FOR KLIPPERSCREEN" "${yellow}"
apt install libsystemd-dev -y
echo
apt install tmux -y
echo
apt install modemmanager -y
echo
apt install dnsmasq-base -y
echo
mkdir -p /etc/NetworkManager/conf.d
nano /etc/NetworkManager/conf.d/any-user.conf <<EOF
[main]
auth-polkit=false
EOF
echo
echo -e "${cyan} INFO: Install done!${white}"

action "REBOOT" "${yellow}"
echo -e "${cyan} INFO: Your Speeder Pad will reboot. Log in to SSH again to continue.${white}"
echo
rm -f /home/pi/sp_installer1.sh
reboot

exit 0