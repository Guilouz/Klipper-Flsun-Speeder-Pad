 # FLSUN Speeder Pad Configurations

![Sans titre-2 copie](https://user-images.githubusercontent.com/12702322/196842330-e200350d-496f-4a1b-a8f7-1793d781dccb.jpg)

<br />

## Table of Contents

- [About](#about)
- [Repo Changelog](#repo-changelog)
- [Useful Links](#useful-links)
- [STL Files](#stl-files)
- [Restore OS Image File](#restore-os-image-file)
- [SSH Connection](#ssh-connection)
- [Change pi User Password](#change-pi-userpassword)
- [Update Ubuntu dependencies](#update-ubuntu-dependencies)
- [Change Timezone](#change-timezone)
- [Change Wi-Fi Location](#change-wi-fi-location)
- [Delete Flsun Builds](#delete-flsun-builds)
- [Install Official Builds (1 instance)](#install-official-builds-1-instance)
- [Install Official Builds (Multiple instances)](#install-official-builds-multiple-instances)
- Update Motherboard Firmware
  - [Update V400 Motherboard Firmware (MKS Robin Nano V2.0 / Nano V2.1 Clone)](#update-v400-motherboard-firmware-mks-robin-nano-v20--nano-v21-clone)
  - [Update V400 Motherboard Firmware (BigTreeTech SKR 3.0)](#update-v400-motherboard-firmware-bigtreetech-skr-30)
  - [Update Super Racer Motherboard Firmware (MKS Robin Nano V3.0/V3.1)](#update-super-racer-motherboard-firmware-mks-robin-nano-v30v31)
  - [Update Super Racer Motherboard Firmware (BigTreeTech SKR 1.3)](#update-super-racer-motherboard-firmware-bigtreetech-skr-13)
  - [Update Super Racer Motherboard Firmware (BigTreeTech SKR 2.0)](#update-super-racer-motherboard-firmware-bigtreetech-skr-20)
- [Use Configurations](#use-configurations)
- [Get USB Serial from Motherboard](#get-usb-serial-from-motherboard)
- [Fix Shutdown button in Mainsail](#fix-shutdown-button-in-mainsail)
- [Add Webcams Support](#add-webcams-support)
- [Install and Update Timelapse](#install-and-update-timelapse)
- [Slicer Side Changes](#slicer-side-changes)
- [Calibrate your Printer](#calibrate-your-printer)
- [Use ADXL345 with Raspberry Pi Pico](#use-adxl345-with-raspberry-pi-pico)
- [Use ADXL345 with Fysetc Portable Input Shaper](#use-adxl345-with-fysetc-portable-input-shaper)
- [Use Neopixels Ring Light](#use-neopixels-ring-light)
- For Advanced Users Only
  - [Enable Root Access](#enable-root-access)
  - [Change SSH Welcome Message and Cleanup Files](#change-ssh-welcome-message-and-cleanup-files)
  - [Set a Static IP Address](#set-a-static-ip-address)
  - [Change Boot Logo](#change-boot-logo)
- [Special Thanks](#special-thanks)

<br />

If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂

[ ![Download](https://user-images.githubusercontent.com/12702322/115148445-e5a40100-a05f-11eb-8552-c1f5d4355987.png) ](https://www.paypal.me/CyrilGuislain)

<br />

## About

By default, FLSUN does not use builds from official GitHub repositories. Updates point to Gitee repositories which are very slow, sometimes inaccessible and not updated.
In addition, during Delta Calibration, tower angles and delta radius are never recalculated in their Klipper build, which can cause several issues.

This procedure explains the whole process in order to obtain Root access on the Speeder Pad, to configure it correctly with optimized printer settings.

This settings are compatible with FLSUN Speeder Pad.

- Useful and automated macros with notifications to KlipperScreen
- Configuration for ADXL345
- Improved Start/End Gcodes
- And more...

<br />

Before using Klipper please read this documentations:

- Klipper (Operating System): https://www.klipper3d.org/
- Moonraker (API Web Server): https://moonraker.readthedocs.io/
- Mainsail (Web Interface): https://docs.mainsail.xyz/
- KlipperScreen (Screen Interface): https://klipperscreen.readthedocs.io/

<br />

## Repo Changelog

**15/03/2023:**
  - Replace FLSUN restoration image file by new V1.2

**12/03/2023:**
  - Improve Gcode Arc support.

**05/03/2023:**
  - Updated macros files to load default Bed Mesh at startup.

**19/02/2023:**
  - Fixed "default" bed mesh in START_PRINT macro.

**18/02/2023:**
  - Fixed V400 Hotend LED for some configuration files
  - Fixed Z-Offset in configuration files

**17/02/2023:**
  - Updated all configuration files so that they are in line with the new version of KlipperScreen. **All your files need to be replaced with the new ones**
  - New version of KlipperScreen which now allows to calibrate the Z-Offset and apply a safety Gcode Offset of 2mm before starting the first print
  - Added configuration files for Super Racer with BigTreetech SKR 2.0 Rev A and Rev B
  - Added new section to fix Shutdown button in Mainsail
  - Improved 'Calibrate your Printer' section for new changes
  - Added Start / End Gcode for Simplify3D

**10/02/2023:**
  - Added new section to fix Shutdown button in Mainsail (need to have latest update of Moonraker)

**30/12/2022:**
  - Fixed bad character in `printer.cfg` files for Super Racer

**24/12/2022:**
  - Updated `macros.cfg` file ([gcode_macro START_PRINT])

**16/12/2022:**
  - Fixed Start Gcode for PrusaSlicer / SuperSlicer (Thanks to Julien Geffray)
  - Changed Hotend preheat to 150C° instead of 100C° in START_PRINT macro

**13/12/2022:**
  - Fixed delete `.gitconfig` file before installing Kiauh in [Delete Flsun Builds](#delete-flsun-builds) section

**12/12/2022:**
  - Updated `macros.cfg` file ([gcode_macro START_PRINT]) for latest Klipper changes with gcode_arcs
  - Added how to add camera support on Speeder Pad screen in [Improve Webcams Support](#improve-webcams-support) section
  - Updated `KlipperScreen.conf` file to support camera url


**11/12/2022:**
  - Changes in [Install Official Builds (1 instance)](#install-official-builds-1-instance) & [Install Official Builds (3 instances)](#install-official-builds-3-instances) sections to install Klipper with Python 3.x as recommended
  - Added new section to [Update V400 Motherboard Firmware (BigTreeTech SKR 3.0)](#update-v400-motherboard-firmware-bigtreetech-skr-30)
  - Added new BigTreeTech SKR 3.0 config files for V400

<br />

## Useful Links

- To calibrate your extruder, see here: https://www.klipper3d.org/Rotation_Distance.html 

- To adjust Pressure Advance, see here: https://www.klipper3d.org/Pressure_Advance.html

- To adjust manually Resonance Compensation, see here: https://www.klipper3d.org/Resonance_Compensation.html

- To mesure Resonances with ADXL, see here: https://www.klipper3d.org/Measuring_Resonances.html

- To use Exclude Objects function, see here: https://docs.mainsail.xyz/features/exclude_objects

- To use Timelapse function, see here: https://github.com/mainsail-crew/moonraker-timelapse/blob/main/docs/configuration.md
  - PDF with settings can be found here: [Instructions for timelapse (corrected).pdf](https://github.com/Guilouz/Klipper-Flsun-Speeder-Pad/files/9842081/Instructions.for.timelapse.corrected.pdf)

- To display thumbnails on screen, see here: https://klipperscreen.readthedocs.io/en/latest/Thumbnails/

- Speeder Pad Mainsail Theme: [Speeder Pad Mainsail Theme.zip](https://github.com/Guilouz/Klipper-Flsun-Speeder-Pad/files/9944550/Speeder.Pad.Mainsail.Theme.zip)

<br />

## STL Files

Many usefull STL for FLSUN Super Racer and V400 can be found on my profiles:

- Printables: [Here](https://www.printables.com/social/352655-guilouz/models)
- Thingiverse: [Here](https://www.thingiverse.com/guilouz/designs)
- ADXL345 Mount for Super Racer : [Here](https://www.printables.com/model/245136-adxl345-mount-for-flsun-super-racer)
- Fysetc Portable Input Shaper Mount for Super Racer : [Here](https://www.printables.com/model/405796-flsun-super-racer-fysetc-portable-input-shaper-mou/files)

<br />

## Restore OS Image File

By default, Root access is not allowed on Speeder Pad. To enable it, follow these instructions to restore OS image file:

Note: A microSD card of at least 32 GB is required.

- Download this restoration image and unzip it: <a href="https://drive.google.com/file/d/11FraKdFJ5tIX5uzo8qZxaVx9p5Q_Lzoa/view?usp=share_link" target="_blank">Speeder Pad Restoration Image V1.2</a>

- Download and install Raspberry Pi Imager here: https://www.raspberrypi.com/software/

- Launch Raspberry Pi Imager:

  <img src="https://user-images.githubusercontent.com/12702322/194968538-4aa44d04-9965-4a57-88c0-99a5deed1670.png">

- Select `Speeder_Pad_V1.2_Restoration-230303.xz` image file as `Operating System` by selecting `Use custom`.

- Select your microSD card as `Storage`.

- Then click `Write`.

- Once the image is written, turn off Speeder Pad if is on and remove all devices plugged into the USB ports.

- Insert microSD card in Speeder Pad and turn on it.

- A loading bar should appear:

  <img src="https://user-images.githubusercontent.com/12702322/196795418-12e3064a-59bd-4bfe-b326-036553e77808.png" width="700">

- And wait until the bar is fully charged and green, this may take several minutes (10/15 minutes):

  <img src="https://user-images.githubusercontent.com/12702322/196795445-4f680693-a39d-4f79-a605-bb0b380cf57c.png" width="700">

- When it's done, turn off Speeder Pad and remove the microSD card.

- Turn Speeder Pad back on, it should start normally and arrive on KlipperScreen splashscreen.

- Wait until KlipperScreen show a connection error message on the Speeder Pad and go to `Menu` --> `Network` and connect it to your WiFi network.

- Once connected, restart the Speeder Pad for the connection to take effect.

- You can now connect to SSH with this login: 
```
  user: pi
  password: flsun
```

<br />

## SSH Connection

- Download and install the MobaXterm software here: https://mobaxterm.mobatek.net/download-home-edition.html

- Launch it then click on the `Session` icon:

![Capture d’écran 2022-12-12 à 02 03 41](https://user-images.githubusercontent.com/12702322/206940814-f1702b7b-d65a-491b-824d-d3b43a066151.jpg)

- Then on then `SSH` icon:

![Capture d’écran 2022-12-12 à 02 08 09](https://user-images.githubusercontent.com/12702322/206940944-c0817b21-7cce-471c-90bd-f8dfc1ce22f2.jpg)

- Enter the IP address of your Speeder Pad in the `Remote Host` field, check the `Specify username` box and enter the username `pi` in the field then click on `OK`:

![Capture d’écran 2022-12-12 à 02 10 23](https://user-images.githubusercontent.com/12702322/206941163-a3c8d2cc-1a1b-467b-8c57-9a3ca0095b29.jpg)

- On the new displayed window, enter the password `flsun` (it's not displayed when typing, this is normal):

![Capture d’écran 2022-12-12 à 02 12 15](https://user-images.githubusercontent.com/12702322/206941248-47377e1f-fbba-4ed6-b2b4-c1a030d9d056.jpg)

- An authorization window will appear, authorize it. It's also possible that another window asking you to change the password will appear, ignore it.

- Once connected, on the left part of the window you have access to the folders and files of your Speeder Pad and on the right part to the SSH command prompt window:

![Capture d’écran 2022-12-12 à 02 13 17](https://user-images.githubusercontent.com/12702322/206941372-21da318e-0175-4219-bc4d-7fbf3f360dcb.jpg)

<br />

## Change pi User Password

It's possible to change the password of the `pi` user:

- In the SSH command prompt window, enter the following command:
```
passwd
```
- You’ll get asked to enter your current password for verification -> `flsun`.

- After verification, you can type in your new password and press `Enter`.
  - **Note: You’ll not be able to see any characters on the window while entering the password. So, don’t panic, just type in your password and press `Enter`.**

- Once you’ve successfully verified your password, it’ll get applied right away.

<br />

## Update Ubuntu dependencies

- In the SSH command prompt window, enter the following command to download updates list (you will need to enter your user password):
```
sudo apt update
```
- Then this command to install all of them:
```
sudo apt full-upgrade
```
- Then remove not needed dependencies if present (one command at a time):
```
sudo apt autoremove
```
```
sudo apt autoclean
```
```
sudo apt clean
```
- And this command to reboot:
```
sudo reboot
```

<br />

## Change Timezone

To change Timezone, follow these instructions:

- In the SSH command prompt window, enter the following command to check the current time zone:
```
timedatectl
```
- You can change your timezone by entering this command:
```
sudo dpkg-reconfigure tzdata
```
- On the page that appears, select your geographic area from the list and press `Enter`.

- Then select your timezone in the new list and press `Enter`.

- You can then verify that the change has been taken into account by retyping this command:
```
timedatectl
```

<br />

## Change Wi-Fi Location

By default, there is no Wi-Fi location defined.

- In the SSH command prompt window, enter the following command to check the current Wi-Fi location:
```
iw reg get
```
- You obtain this:
```
global
country 00: DFS-UNSET
        (755 - 928 @ 2), (N/A, 20), (N/A), NO-IR
        (2402 - 2472 @ 40), (N/A, 20), (N/A)
        (2457 - 2482 @ 20), (N/A, 20), (N/A), AUTO-BW, NO-IR
        (2474 - 2494 @ 20), (N/A, 20), (N/A), NO-OFDM, NO-IR
        (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW, NO-IR
        (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW, NO-IR
        (5490 - 5730 @ 160), (N/A, 20), (0 ms), DFS, NO-IR
        (5735 - 5835 @ 80), (N/A, 20), (N/A), NO-IR
        (57240 - 63720 @ 2160), (N/A, 0), (N/A)
```
- All available locations can be displayed with this command:
```
sudo cat /usr/share/zoneinfo/zone.tab
```
- To change the location enter the following command replacing `FR` by your country (you will need to enter your user password):
```
sudo iw reg set FR
```
You can verify that the change has been made by entering this command again:
```
iw reg get
```
- You obtain this (related to your country):
```
global
country FR: DFS-ETSI
        (2400 - 2483 @ 40), (N/A, 20), (N/A)
        (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
        (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
        (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
        (5725 - 5875 @ 80), (N/A, 13), (N/A)
        (5945 - 6425 @ 160), (N/A, 23), (N/A), NO-OUTDOOR
        (57000 - 71000 @ 2160), (N/A, 40), (N/A)
```
- To make the location permanent, enter the following command replacing `FR` by your country (you will need to enter your user password):
```
sudo sed -i 's/^REG.*=$/&FR/' /etc/default/crda
```
- Then, this command:
```
sudo sed -i '/^exit 0/ d' /etc/rc.local
```
- And this command replacing `FR` by your country:
```
echo -e "iw reg set FR\nexit 0" | sudo tee -a /etc/rc.local
```
- Then reboot with this command:
```
sudo reboot
```

<br />

## Delete Flsun Builds

To upgrade to official builds, follow these instructions:

- In the SSH command prompt window, enter the following command to install Kiauh:
```
cd ~ && git clone https://github.com/th33xitus/kiauh.git
```
- Launch Kiauh by entering this command:
```
./kiauh/kiauh.sh
```
- This window should appear:

<img width="1302" alt="remove1" src="https://user-images.githubusercontent.com/12702322/225440262-79329b4c-b4ad-4199-9534-7003a701c82c.png">

- Enter in `3) [Remove]` menu by typing `3` then `Enter`:

<img width="1302" alt="remove2" src="https://user-images.githubusercontent.com/12702322/225440293-56ccef51-b580-4f92-aaad-459980b8a22f.png">

- Remove `10) [MJPG-Streamer]` by typing `10` then `Enter` (you will need to enter your user password).

- Remove `7) [KlipperScreen]` by typing `7` then `Enter`.

- Remove `3) [Mainsail]` by typing `3` then `Enter`.

- Remove `2) [Moonraker]` by typing `2` then `Enter`.

- When it's done, remove `1) [Klipper]` by typing `1` then `Enter`.

- When it's done, go back to main menu by typing `B` then `Enter`.

- Exit Kiauh by typing `Q` then `Enter`.

- Enter the following commands (one at a time):
```
sudo rm -rf /home/pi/.moonraker_database_1 && rm -rf /home/pi/.moonraker_database_2 && rm -rf /home/pi/.moonraker_database_3
```
```
sudo rm -rf /home/pi/klipper_config && rm -rf /home/pi/klipper_logs && rm -rf /home/pi/moonraker-timelapse
```
```
sudo rm /home/pi/savedVariables1.cfg && rm /home/pi/savedVariables2.cfg && rm /home/pi/savedVariables3.cfg
```
```
sudo rm -rf /home/pi/.cache && rm -rf /home/pi/.gnupg && rm -rf /home/pi/.local && rm -rf /home/pi/.config
```

<br />

## Install Official Builds (1 instance)

- Relaunch Kiauh by entering this command:
```
./kiauh/kiauh.sh
```
- Enter in `1) [Install]` menu by typing `1` then `Enter`:

<img width="1303" alt="install1" src="https://user-images.githubusercontent.com/12702322/225440361-a351a1fc-97dd-4d9e-94c9-e7516a17106c.png">

- Install `1) [Klipper]` by typing `1` then `Enter`.

- Select `1) [Python 3.x]  (recommended)` by typing `1` then `Enter`.

- Then enter the number of Klipper instance by typing `1` and `Enter` to confirm:

![Capture d’écran 2022-12-12 à 01 57 02](https://user-images.githubusercontent.com/12702322/206940381-4ecf5d7f-a763-49c0-98f9-e7aee72b518f.jpg)

- When it's done, install `2) [Moonraker]` by typing `2` then `Enter` and confirm by typing `Y`.

- When it's done, install `3) [Mainsail]` by typing `3` then `Enter` and select no by typing `n` when asked to add the recommended macros.

- When it's done, go back to main menu by typing `B` then `Enter`.

- Exit Kiauh by typing `Q` then `Enter`.

- Enter the following commands (one at a time) to install KlipperScreen:
```
cd ~ && git clone https://github.com/Guilouz/KlipperScreen-Flsun-Speeder-Pad.git
```
```
sudo mv /home/pi/KlipperScreen-Flsun-Speeder-Pad /home/pi/KlipperScreen
```
```
./KlipperScreen/scripts/KlipperScreen-install.sh
```

Note: Installation may take several minutes.

- When it's done, enter this commands (one at a time):
```
cd ~ && ln -s /home/pi/gcode_files/USB-Disk /home/pi/printer_data/gcodes/USB-Disk
```
```
sudo reboot
```
- After reboot, go to your Mainsail Web interface then select the `Machine` tab.

- Open the `moonraker.conf` file and add the following lines at the end of the file:
```
[update_manager KlipperScreen]
type: git_repo
path: /home/pi/KlipperScreen
origin: https://github.com/Guilouz/KlipperScreen-Flsun-Speeder-Pad.git
env: /home/pi/.KlipperScreen-env/bin/python
requirements: scripts/KlipperScreen-requirements.txt
install_script: scripts/KlipperScreen-install.sh
```
- Once done, click on `SAVE & RESTART` at the top right to save the file.

- You will get the latest versions of KlipperScreen which point to my repo (More info are available here: [KlipperScreen-Flsun-Speeder-Pad](https://github.com/Guilouz/KlipperScreen-Flsun-Speeder-Pad)).

- Your Speeder Pad now running offical builds with 1 instance.

<br />

## Install Official Builds (Multiple instances)

In this section, we will install 3 instances but you can install 2 if you want (no more than 3 is recommended).

- Relaunch Kiauh by entering this command:
```
./kiauh/kiauh.sh
```
- Enter in `1) [Install]` menu by typing `1` then `Enter`:

<img width="1303" alt="install1" src="https://user-images.githubusercontent.com/12702322/225440573-aa230cb5-5506-4de5-bbcb-c2b5bf28f701.png">

- Install `1) [Klipper]` by typing `1` then `Enter`.

- Select `1) [Python 3.x]  (recommended)` by typing `1` then `Enter`.

- Then enter the number of Klipper instances by typing `3` and `Enter` to confirm:

![Capture d’écran 2022-12-12 à 02 23 50](https://user-images.githubusercontent.com/12702322/206942150-f6ec553f-e44d-4b95-8cc4-afb715d8c659.jpg)

- When asked to assign custom names, select NO by typing `N` then `Enter`:

![Capture d’écran 2022-12-12 à 02 26 10](https://user-images.githubusercontent.com/12702322/206942312-2992495b-956c-48ec-8a68-68bc5aeb9bd6.jpg)

- When it's done, install `2) [Moonraker]` by typing `2` then `Enter` and confirm by typing `Y`.

- Then enter the number of Moonraker instances by typing `3` then `Enter` and confirm by typing `Y`:

![Capture d’écran 2022-12-12 à 02 34 51](https://user-images.githubusercontent.com/12702322/206942863-61f55f6a-a8c8-4234-b3cc-cfca87e6ccfa.jpg)

- When it's done, you get your 3 instances with their IP addresses and ports, write them down they will be useful later:

![Capture d’écran 2022-12-12 à 02 44 04](https://user-images.githubusercontent.com/12702322/206943753-4f871a6b-0917-4096-9dc9-0801eae58892.jpg)

- Install `3) [Mainsail]` by typing `3` then `Enter` and select no by typing `n` when asked to add the recommended macros.

- When it's done, go back to main menu by typing `B` then `Enter`.

- Exit Kiauh by typing `Q` then `Enter`.

- Enter the following commands (one at a time) to install KlipperScreen:
```
cd ~ && git clone https://github.com/Guilouz/KlipperScreen-Flsun-Speeder-Pad.git
```
```
sudo mv /home/pi/KlipperScreen-Flsun-Speeder-Pad /home/pi/KlipperScreen
```
```
./KlipperScreen/scripts/KlipperScreen-install.sh
```

Note: Installation may take several minutes.

- When it's done, enter this commands (one at a time):
```
cd ~ && ln -s /home/pi/gcode_files/USB-Disk /home/pi/printer_1_data/gcodes/USB-Disk
```
```
ln -s /home/pi/gcode_files/USB-Disk /home/pi/printer_2_data/gcodes/USB-Disk
```
```
ln -s /home/pi/gcode_files/USB-Disk /home/pi/printer_3_data/gcodes/USB-Disk
```
```
sudo reboot
```
- After reboot, go to your Mainsail Web interface then select the `Machine` tab.

- Open the `moonraker.conf` file and add the following lines at the end of the file:
```
[update_manager KlipperScreen]
type: git_repo
path: /home/pi/KlipperScreen
origin: https://github.com/Guilouz/KlipperScreen-Flsun-Speeder-Pad.git
env: /home/pi/.KlipperScreen-env/bin/python
requirements: scripts/KlipperScreen-requirements.txt
install_script: scripts/KlipperScreen-install.sh
```
- Once done, click on `SAVE & RESTART` at the top right to save the file.

- You will get the latest versions of KlipperScreen which point to my repo (More info are available here: [KlipperScreen-Flsun-Speeder-Pad](https://github.com/Guilouz/KlipperScreen-Flsun-Speeder-Pad)).

- Your Speeder Pad now running offical builds with 3 instances.

<br />

## Update V400 Motherboard Firmware (MKS Robin Nano V2.0 / Nano V2.1 Clone)

It's important that your motherboard firmware version matches with the installed Klipper version.

Version is visible on `System Loads` tile -> `mcu` section (in `Machine` tab).

To update firmware, follow these instructions:

- In the SSH command prompt window, enter the following commands (one at a time):
```
cd ~/klipper/
```
```
make menuconfig
```
- Move on the menu with the `Up` and `Down` keys of your keyboard and validate the selected item with the `Enter` key and select these settings:

![Capture d’écran 2022-12-12 à 02 59 51](https://user-images.githubusercontent.com/12702322/206945000-ec21cbf0-25ea-41dd-a5f1-26ee96732a77.jpg)

- Then on your keyboard press the `Q` key then `Y` to save configuration.

- Enter the following commands to compile firmware (one at a time):
```
make clean
```
```
make
```
- Then this one to convert firmware:
```
./scripts/update_mks_robin.py out/klipper.bin out/Robin_nano35.bin
```
- V400 motherboard doesn't support DFU mode, so it's not possible to install the firmware directly. It's therefore necessary to install it manually.

- Get the firmware named `Robin_nano35.bin` in `/home/pi/klipper/out/` directory (on the left part of MobaXterm).

- Copy it to the root of an microSD card formatted in FAT32 and an allocation size of 4096.

- Insert the microSD card into the motherboard then turn on the printer.

- Installation only takes a few seconds, to verify that the firmware has been successfully installed, the file on the microSD card must have been renamed to `ROBIN_NANO35.BIN.CUR`.

<br />

## Update V400 Motherboard Firmware (BigTreeTech SKR 3.0)

**Note:** Wiring for BigTreeTech SKR 3.0 is available [here](https://github.com/Guilouz/Klipper-Flsun-Speeder-Pad/blob/main/Configurations/FLSUN%20V400/FLSUN%20V400%20-%20BigTreeTech%20SKR%203.0%20Wiring.png?raw=true) 

It's important that your motherboard firmware version matches with the installed Klipper version.

Version is visible on `System Loads` tile -> `mcu` section (in `Machine` tab).

To update firmware, follow these instructions:

- In the SSH command prompt window, enter the following commands (one at a time):
```
cd ~/klipper/
```
```
make menuconfig
```
- Move on the menu with the `Up` and `Down` keys of your keyboard and validate the selected item with the `Enter` key and select these settings:

![Capture d’écran 2022-12-12 à 22 27 05](https://user-images.githubusercontent.com/12702322/207158189-83cac62b-dbed-475d-b9fa-edea571bf294.jpg)

- Then on your keyboard press the `Q` key then `Y` to save configuration.

- Enter the following commands to compile firmware (one at a time):
```
make clean
```
```
make
```
- Get the firmware named `klipper.bin` in `/home/pi/klipper/out/` directory (on the left part of MobaXterm).

- Rename it to `firmware.bin` and copy it to the root of an microSD card formatted in FAT32 and an allocation size of 4096.

- Insert the microSD card into the motherboard then turn on the printer.

- Installation only takes a few seconds, to verify that the firmware has been successfully installed, the file on the microSD card must have been renamed to `FIRMWARE.BIN.CUR`.

<br />

**Note:** For future Klipper firmware updates, it's possible to directly flash the firmware via SSH.

- USB serial is needed for this, you can retrieve it by following this step: [Get USB Serial from Motherboard](#get-usb-serial-from-motherboard)

- In the SSH command prompt window, enter the following command :
```
make flash FLASH_DEVICE=/dev/serial/by-id/XXXXX (replacing the XXXXX with the serial obtained previously)
```
- It should look like this:
```
make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32h743xx_39004C001251303232383230-if00
```
- There will be a `dfu-util: Error during download get_status` error message after the update. Don't pay attention to it, the most important thing is to get the green line `File downloaded successfully`.

<br />

## Update Super Racer Motherboard Firmware (MKS Robin Nano V3.0/V3.1)

It's important that your motherboard firmware version matches with the installed Klipper version.

Version is visible on `System Loads` tile -> `mcu` section (in `Machine` tab).

To update firmware, follow these instructions:

- In the SSH command prompt window, enter the following commands (one at a time):
```
cd ~/klipper/
```
```
make menuconfig
```
- Move on the menu with the `Up` and `Down` keys of your keyboard and validate the selected item with the `Enter` key and select these settings:

![Capture d’écran 2022-12-12 à 03 05 15](https://user-images.githubusercontent.com/12702322/206945543-71505dac-830a-4c9a-8328-becd2deb5780.jpg)

- Then on your keyboard press the `Q` key then `Y` to save configuration.

- Enter the following commands to compile firmware (one at a time):
```
make clean
```
```
make
```
- Super Racer motherboard doesn't support DFU mode, so it's not possible to install the firmware directly. It's therefore necessary to install it manually.

- Get the firmware named `klipper.bin` in `/home/pi/klipper/out/` directory (on the left part of MobaXterm).

- Rename it to `Robin_nano_v3.bin` and copy it to the root of an microSD card formatted in FAT32 and an allocation size of 4096.

- Insert the microSD card into the motherboard then turn on the printer.

- Installation only takes a few seconds, to verify that the firmware has been successfully installed, the file on the microSD card must have been renamed to `ROBIN_NANO_V3.BIN.CUR`.

<br />

## Update Super Racer Motherboard Firmware (BigTreeTech SKR 1.3)

It's important that your motherboard firmware version matches with the installed Klipper version.

Version is visible on `System Loads` tile -> `mcu` section (in `Machine` tab).

To update firmware, follow these instructions:

- In the SSH command prompt window, enter the following commands (one at a time):
```
cd ~/klipper/
```
```
make menuconfig
```
- Move on the menu with the `Up` and `Down` keys of your keyboard and validate the selected item with the `Enter` key and select these settings:

![Capture d’écran 2022-12-12 à 03 11 55](https://user-images.githubusercontent.com/12702322/206946211-00f0fc3f-19ae-4ea7-8c57-3304cf25803e.jpg)

- Then on your keyboard press the `Q` key then `Y` to save configuration.

- Enter the following commands to compile firmware (one at a time):
```
make clean
```
```
make
```
- Super Racer motherboard doesn't support DFU mode, so it's not possible to install the firmware directly. It's therefore necessary to install it manually.

- Get the firmware named `klipper.bin` in `/home/pi/klipper/out/` directory (on the left part of MobaXterm).

- Rename it to `firmware.bin` and copy it to the root of an microSD card formatted in FAT32 and an allocation size of 4096.

- Insert the microSD card into the motherboard then turn on the printer.

- Installation only takes a few seconds, to verify that the firmware has been successfully installed, the file on the microSD card must have been renamed to `FIRMWARE.BIN.CUR`.

<br />

## Update Super Racer Motherboard Firmware (BigTreeTech SKR 2.0)

There are two revisions of BigTreetech SKR 2.0 motherboards, one with an **SMT32F407** processor called **Rev A** and the other with an **SMT32F429** processor called **Rev B**:

| SMT32F407 (Rev A)   | SMT32F429 (Rev B)                           |
| :---------: | :----------------------------------: |
| ![SMT32F407](https://user-images.githubusercontent.com/12702322/219621259-b4c4f4b6-fa66-42cb-94b9-d48a631802c5.png)   | ![SMT32F429](https://user-images.githubusercontent.com/12702322/219621431-3efe5ef1-b546-49c8-8e91-c7b9d6a32f5e.png)  |

It's important that your motherboard firmware version matches with the installed Klipper version.

Version is visible on `System Loads` tile -> `mcu` section (in `Machine` tab).

To update firmware, follow these instructions:

- In the SSH command prompt window, enter the following commands (one at a time):
```
cd ~/klipper/
```
```
make menuconfig
```
- Move on the menu with the `Up` and `Down` keys of your keyboard and validate the selected item with the `Enter` key and select these settings for `BigTreeTech SKR 2.0 Rev A (STM32F407)`:

![skr2 0-a](https://user-images.githubusercontent.com/12702322/219622176-46c4f792-eb97-4296-b1ba-8585cb1b2d2b.png)

- Move on the menu with the `Up` and `Down` keys of your keyboard and validate the selected item with the `Enter` key and select these settings for `BigTreeTech SKR 2.0 Rev B (STM32F429)`:

![skr2 0-b](https://user-images.githubusercontent.com/12702322/219622198-14757b3a-10b4-4283-bdc1-204b74c4637e.png)

- Then on your keyboard press the `Q` key then `Y` to save configuration.

- Enter the following commands to compile firmware (one at a time):
```
make clean
```
```
make
```
- Get the firmware named `klipper.bin` in `/home/pi/klipper/out/` directory (on the left part of MobaXterm).

- Rename it to `firmware.bin` and copy it to the root of an microSD card formatted in FAT32 and an allocation size of 4096.

- Insert the microSD card into the motherboard then turn on the printer.

- Installation only takes a few seconds, to verify that the firmware has been successfully installed, the file on the microSD card must have been renamed to `FIRMWARE.BIN.CUR`.

<br />

## Use Configurations

**In case you use 1 instance:**

- Download and unzip my repository zip file here: https://github.com/Guilouz/Klipper-Flsun-Speeder-Pad/archive/refs/heads/main.zip

- Go to your Mainsail Web interface then click on `Machine` tab.

- Then upload `KlipperScreen.conf`, `printer.cfg`, `macros.cfg`, `neopixels.cfg`, `adxl345_pico.cfg` and `adxl345_fysetc.cfg` files located in `Configurations` directory according to your printer.

- Restart Speeder Pad and printer to take effect.

<br />

**In case you use more than 1 instance:**

- Download and unzip my repository zip file here: https://github.com/Guilouz/Klipper-Flsun-Speeder-Pad/archive/refs/heads/main.zip

- Go to your Mainsail Web interface then click on `Machine` tab.

- Then upload `KlipperScreen.conf`, `printer.cfg`, `macros.cfg`, `neopixels.cfg`, `adxl345_pico.cfg` and `adxl345_fysetc.cfg` files located in `Configurations` directory according to your printer.

- Open the `KlipperScreen.conf` file and edit it to enable multiple instance by removing the `#` symbols like this:

  <img src="https://user-images.githubusercontent.com/12702322/197651386-5a33d848-0416-421a-871f-c25288c84d4d.jpg" width="700">

- Go to the Mainsail settings (gear at the top right of the interface) and select `PRINTERS` tab.

- Add as many printers as you have installed instances of Klipper/Moonraker by adding the IP address of your Speeder Pad and the port of each instance (The same IP addresses and ports obtained after installing Moonraker) like this:

  <img src="https://user-images.githubusercontent.com/12702322/197652480-330ed03f-4820-4507-a0e1-755ce286ea44.jpg" width="700">

- You can now select `Printers` on left tab and switch to others printers.

- You need to upload `printer.cfg`, `macros.cfg`, `neopixels.cfg`, `adxl345_pico.cfg` and `adxl345_fysetc.cfg` files for each printer.

- Open `printer.cfg` file, find `[save_variables]` and `[virtual_sdcard]` sections and edit paths for each configured printer:

**For 1st printer:**
```
[save_variables]
filename: ~/printer_1_data/config/variables.cfg

[virtual_sdcard]
path: ~/printer_1_data/gcodes
```

**For 2nd printer:**
```
[save_variables]
filename: ~/printer_2_data/config/variables.cfg

[virtual_sdcard]
path: ~/printer_2_data/gcodes
```

**For 3rd printer:**
```
[save_variables]
filename: ~/printer_3_data/config/variables.cfg

[virtual_sdcard]
path: ~/printer_3_data/gcodes
```

**Note:** Changes in the `KlipperScreen.conf` file only have an effect on the first configured printer, it's not needed on others.

- Restart Speeder Pad and printer to take effect.

**Note:** You can select printer you want at startup on the screen. You can also enable `default_printer` setting in `KlipperScreen.conf` to start directly on printer you want and switch to others with shuffle button on the left side.

<br />

## Get USB Serial from Motherboard

- Connect your printer to one of the Speeder Pad's USB ports.

- Connect in SSH then enter the following command to retrieve the motherboard USB serial:
```
cd ~ && ls /dev/serial/by-id/*
```
- You should see the USB serial appear like this (serial is different depending on the motherboard):

  <img src="https://user-images.githubusercontent.com/12702322/197362963-65c93e37-1cd2-49d3-83d3-45a98450a44f.jpg" width="700">

- In case you use same multiple printers connected on the Speeder Pad and you only see one serial when running this command, enter this one instead:
```
ls /dev/serial/by-path/*
```
- If the second command shows multiple results, adjust the path of the serial accordingly, so all instances of ```/by-id/``` should be replaced with ```/by-path/```.

- Go to your Mainsail Web interface then click on `Machine` tab.

- Open `printer.cfg` file and find `[mcu]` section.

- Edit the following existing line with serial you have just obtained like this:
```
serial: /dev/serial/by-id/usb-1a86_USB_Serial-if00-port0
```
- Click on `SAVE & RESTART` at the top right to save the file.

- Your printer should connect to your Speeder Pad.

<br />

## Fix Shutdown button in Mainsail

Shutdown button in Mainsail only restarts the Speeder Pad because some distros don't support `poweroff` function and this is the case for the Ubuntu Operating System.

To correct this, in the SSH command prompt window, enter the following commands (one at time):
```
cd ~/moonraker/scripts
```
```
./set-policykit-rules.sh
```
```
sudo reboot
```
- After reboot, go to your Mainsail Web interface then select the `Machine` tab.

- Open the `moonraker.conf` file and add the following lines:
```
[machine]
shutdown_action: halt
```
- Once done, click on `SAVE & RESTART` at the top right to save the file.

- The Shutdown button now properly shuts off the Pad.


<br />

## Add Webcams Support

It's possible to improve Webcams support and in particular the framerate by uninstalling mjpg-streamer and installing Crowsnest daemon (see [here](https://github.com/mainsail-crew/crowsnest) for more info).

<br />

**Installing Crowsnest:**

- Launch Kiauh by entering this command:
```
./kiauh/kiauh.sh
```
- Enter in `1) [Install]` menu by typing `1` then `Enter`:

- Install `11) [Crownest]` by typing `11` then `Enter`.

- For 1 instance, nothing is asked and installation is automatic.

    - For more than 1 instance, when asked to continue with configuration select `Yes` by typing `y`.

    - For more than 1 instance when asked to continue to install Crowsnest select `Yes` by typing `Y` then `Enter`.

    - For more than 1 instance  when asked to specify path for config file (crowsnest.conf) type:
    ```
    /home/pi/printer_1_data/config
    ```
    - For more than 1 instance when asked to specify path for log file (crowsnest.logs) type:
    ```
    /home/pi/printer_1_data/logs
    ```
    - For more than 1 instance when asked to specify path for environment file (crowsnest.env) type:
    ```
    /home/pi/printer_1_data/systemd
    ```
    - For more than 1 instance when asked if Raspicam Fix should be applied select `No` by typing `N` then `Enter`.

    - For more than 1 instance when asked to add Crowsnest Update Manager entry to moonraker.conf select `No` by typing `N` then `Enter`.

- When asked to reboot NOW select `Yes` by typing `y` then `Enter`.

- After restart, go to your Mainsail Web interface then click on `Machine` tab.

- Open the `moonraker.conf` file and and add the following lines at the end of the file:
```
[update_manager crowsnest]
type: git_repo
path: ~/crowsnest
origin: https://github.com/mainsail-crew/crowsnest.git
managed_services: crowsnest
install_script: tools/install.sh
```
- Once done, click on `SAVE & RESTART` at the top right to save the file.

- You can now click the refresh button (still in the Machine tab) on the Update Manager tile.

- You will see a new crowsnest line appear.

- You can now configure your webcam (resolution, fps, focus etc...) by clicking on the `EDIT CROWSNEST.CONF` link in the `WEBCAMS` tab of Mainsail settings.

  <img src="https://user-images.githubusercontent.com/12702322/198850218-a8e12baf-f057-40c5-8203-9cf5ff7d1efa.jpg" width="700">

<br />


**Add camera support on the Speeder Pad screen:**

- Go to your Mainsail Web interface then click on `Machine` tab.

- Open the `KlipperScreen.conf` file and and uncomment the line:
```
camera_url: http://127.0.0.1/webcam/?action=stream
```
- Click on SAVE & RESTART at the top right to save the file.

- A new `Camera` icon will appear in the `Actions` menu.

<br />


**Uninstalling Crowsnest:**

- If needed you can uninstall Crowsnest by entering this command:
```
./kiauh/kiauh.sh
```
- Enter in `3) [Remove]` menu by typing `3` then `Enter`:

- Remove `9) [Crownest]` by typing `9` then `Enter`.

- When asked if you want to remove Crowsnest select `Yes` by typing `y`.

- When asked if you want to remove crowsnest.conf file select `Yes` by typing `y`.

- Go to your Mainsail Web interface then click on `Machine` tab.

- Open the `moonraker.conf` file and and remove this lines:
```
[update_manager crowsnest]
type: git_repo
path: ~/crowsnest
origin: https://github.com/mainsail-crew/crowsnest.git
managed_services: crowsnest
install_script: tools/install.sh
```
- When it's done, restart the Speeder Pad.


<br />

## Install and Update Timelapse

- In the SSH command prompt window, enter the following commands (one at a time):

**In case you use 1 instance:**
```
cd ~ && git clone https://github.com/mainsail-crew/moonraker-timelapse.git
```
```
ln -sf "/home/pi/moonraker-timelapse/component/timelapse.py" "/home/pi/moonraker/moonraker/components/timelapse.py"
```
```
ln -sf "/home/pi/moonraker-timelapse/klipper_macro/timelapse.cfg" "/home/pi/printer_data/config/timelapse.cfg"
```
```
sudo apt install ffmpeg
```
```
sudo reboot
```

**In case you use 3 instances:**
```
cd ~ && git clone https://github.com/mainsail-crew/moonraker-timelapse.git
```
```
ln -sf "/home/pi/moonraker-timelapse/component/timelapse.py" "/home/pi/moonraker/moonraker/components/timelapse.py"
```
```
ln -sf "/home/pi/moonraker-timelapse/klipper_macro/timelapse.cfg" "/home/pi/printer_1_data/config/timelapse.cfg"
```
```
ln -sf "/home/pi/moonraker-timelapse/klipper_macro/timelapse.cfg" "/home/pi/printer_2_data/config/timelapse.cfg"
```
```
ln -sf "/home/pi/moonraker-timelapse/klipper_macro/timelapse.cfg" "/home/pi/printer_3_data/config/timelapse.cfg"
```
```
sudo apt install ffmpeg
```
```
sudo reboot
```

- Go to your Mainsail Web interface then click on `Machine` tab.

- Open the `moonraker.conf` file and add the following lines at the end of the file:
```
[timelapse]

[update_manager timelapse]
type: git_repo
primary_branch: main
path: ~/moonraker-timelapse
origin: https://github.com/mainsail-crew/moonraker-timelapse.git
managed_services: klipper moonraker
```
- Once done, click on `SAVE & RESTART` at the top right to save the file.

- You can now click the refresh button (still in the Machine tab) on the `Update Manager` tile.

- You will see a new `timelapse` line appear.

  <img src="https://user-images.githubusercontent.com/12702322/188324381-3ab16337-e7da-4029-a318-ba41a4884ded.jpg" width="700">

<br />

## Slicer Side Changes

- Change your Start and End Gcode in your Slicer settings like this:

  - For **Cura**:
    - Start Gcode:
      ```
      ;Nozzle diameter = {machine_nozzle_size}
      ;Filament type = {material_type}
      ;Filament name = {material_brand} {material_name}
      ;Filament weight = {filament_weight}
      ;M109 S{material_print_temperature}
      ;M190 S{material_bed_temperature}
      
      START_PRINT BED_TEMP={material_bed_temperature_layer_0} EXTRUDER_TEMP={material_print_temperature_layer_0}
      ```
    - End Gcode:
      ```
      END_PRINT
      ```
    
  - For **PrusaSlicer** / **SuperSlicer**:
    - Start Gcode:
      ```
      START_PRINT BED_TEMP=[first_layer_bed_temperature] EXTRUDER_TEMP=[first_layer_temperature]
      M104 S[first_layer_temperature]
      M190 S[first_layer_bed_temperature]
      ```
    - End Gcode:
      ```
      END_PRINT
      ```

  - For **LycheeSlicer**:
    - Start Gcode:
      ```
      START_PRINT BED_TEMP={bed_temp} EXTRUDER_TEMP={temp}
      ```
    - End Gcode:
      ```
      END_PRINT
      ```
      
   - For **Simplify3D**:
     - Start Gcode:
       ```
       START_PRINT BED_TEMP=[platform0_temperature] EXTRUDER_TEMP=[extruder0_temperature]
       ```
     - End Gcode:
       ```
       END_PRINT
       ```
 
 <br />

- Firmware retraction gives an advantage compared to Slicer retraction, it can be modified during a print (from Mainsail or KlipperScreen) and therefore the same gcode can be printed with different parameters without the need to be re-sliced.

  - For **Cura**, it's needed to install `Klipper Settings Plugin` (available here: [Klipper Settings Plugin](https://github.com/jjgraphix/KlipperSettingsPlugin)) and enable `Enable Firmware Retraction` setting like that:

  ![190531375-dc2def8d-9190-47c8-ae6e-bc7efaf2ce04](https://user-images.githubusercontent.com/12702322/197653257-9a4c29cc-64c0-4aa4-9077-32b30a9634d2.jpg)

  - For **PrusaSclicer / SuperSlicer**, you just need to enable `Use firmware retraction` setting like that:

![Capture d’écran 2022-12-12 à 03 21 47](https://user-images.githubusercontent.com/12702322/206947349-f522cf58-ce9f-4bd4-88a6-e73893efeaa3.jpg)
<br />

## Calibrate your Printer

This calibrations can be done by Mainsail Interface with Macros or on Speeder Pad directly.

- Calibrate your extruder by calculing Rotation Distance (see this documentation : <a href="https://www.klipper3d.org/Rotation_Distance.html" target="blank">Rotation Distance | Klipper</a>)

- Calibrate Z-OFFSET with `Z_OFFSET_CALIBRATION` macro.

  - :warning: The leveling sensor must be connected for this operation !

  - This function performs a palpation on the bed, then raises the hotend and starts the manual adjustment function:

    <img src="https://user-images.githubusercontent.com/12702322/219629680-28b7180f-5293-4198-9ac6-2da4fea12d1e.png" width="400">
    
  - Then remove the leveling sensor and using a piece of "copy machine paper" between the bed and the nozzle, adjust the height of the Z until you feel a little friction when pushing the paper back and forth. This helps determine the actual distance between the nozzle and the bed.
    
    Note: Prefer to use the buttons in the `ADVANCED` section, they are more precise and this could prevent the nozzle from forcing on the bed.
  
  - Once these steps are completed, you can click on `ACCEPT` to validate the Z-Offset measurement.
  
  - It's necessary to save the configuration by clicking on the `SAVE` macro.

- Calibrate ENDSTOPS with `ENDSTOPS_CALIBRATION` macro and save the configuration by clicking on the `SAVE` macro.

- Start DELTA CALIBRATION with `DELTA_CALIBRATION` macro and save the configuration by clicking on the `SAVE` macro.

- Start BED LEVELING with `BED_LEVELING` macro and save the configuration by clicking on the `SAVE` macro.

- Start BED PID with `PID_BED_65` macro and save the configuration by clicking on the `SAVE` macro.

- Start HOTEND PID with `PID_HOTEND_220` macro and save the configuration by clicking on the `SAVE` macro.

- After all the calibrations done, I recommend to apply a Safety Offset of 2 mm via the `SECURITY_OFFSET` macro.

  This could prevent the nozzle from scratching or sinking on the bed in the event of an incorrect adjustment of the Z-Offset.
  
- After performing all printer calibrations, then start a print and adjust the first layer using babysteps via the `Adjustments` button in KlipperScreen or via the `Headline` section in Mainsail:

  <img src="https://user-images.githubusercontent.com/12702322/219790848-3df39a8d-f5e8-4d1b-97bf-976226c09b20.png" width="400">

- :warning: Don't save the Z-Offset value, a macro save automatically this value in the variables.cfg file and reload it automatically when Klipper starts:

  <img src="https://user-images.githubusercontent.com/12702322/219791279-35edfc40-e84c-4f77-a7e7-993d28d28dec.png" width="400">

- You can find a test STL to print to fit your first layer here: <a href="https://github.com/Guilouz/Klipper-Flsun-Speeder-Pad/raw/main/Downloads/First_Layer_Test.stl">First_Layer_Test.stl</a>

<br />

## Use ADXL345 with Raspberry Pi Pico

You can use ADXL345 with FLSUN Speeder Pad for measuring Resonances via USB with a Raspberry Pi Pico.

**Needed:**
- Raspberry Pi Pico
- ADXL345 Accelerometer
- USB-A/Male to Micro-USB/Male Cable
- Cable, tin and soldering iron

**Wiring:**

<img src="https://user-images.githubusercontent.com/12702322/188179060-33c3566d-80c7-4f19-8772-da85fd3704c4.png" width="600">

- Some dependencies are required to use ADXL345, install them with this following commands (one at a time):
```
sudo apt update
```
```
sudo apt install python3-numpy python3-matplotlib libatlas-base-dev
```
- Followed by this command to install Numpy in Klipper's environment:
```
~/klippy-env/bin/pip install -v numpy
```
- It's also necessary to compile firmware for Raspberry Pico, enter the following commands (one at a time):
```
cd ~/klipper/
```
```
make menuconfig
```
- Select these settings:
![Capture d’écran 2022-12-12 à 03 17 31](https://user-images.githubusercontent.com/12702322/206946770-d3ef1763-072e-48c8-8e48-7549f6dfd995.jpg)

- Then on your keyboard press the `Q` key then `Y` to save configuration.

- Enter the following commands to compile firmware (one at a time):
```
make clean
```
```
make
```
- Plug Raspberry Pi Pico into one of the Speeder Pad's USB ports while holding down the `BOOTSEL` button.

- Type this commands to flash firmware (one at a time):
```
cd ~ && sudo mount /dev/sda1 /mnt
```
```
sudo cp /home/pi/klipper/out/klipper.uf2 /mnt/
```
- Now disconnect and reconnect the accelerometer, without holding the `BOOTSEL` button this time to restart it in normal mode.

- Then, type this command to retrieve the serial:
```
cd ~ && ls /dev/serial/by-id/*
```
- You should see 2 serials appear, one is your printer serial an other is the Raspberry Pi Pico, the one with the mention `Klipper Rp2040`:

  <img src="https://user-images.githubusercontent.com/12702322/188280489-5db90d97-6f15-45a8-9f06-bd9da21b2cac.jpg" width="700">

- Go to your Mainsail Web interface then click on `Machine` tab.

- Open `adxl345_pico.cfg` file and edit following line with serial you have just obtained:
```
serial: /dev/serial/by-id/usb-Klipper_rp2040_E6605481DB318D34-if00
```
- Click on `SAVE & RESTART` at the top right to save the file.

- Then uncomment (remove the #) to the following line in the `printer.cfg` file to enable ADXL support:
```
[include adxl345_pico.cfg]
```
- Click on `SAVE & RESTART` at the top right to save the file.

- You should see the `ADXL MCU` connecting to Klipper.

- You can test accelerometer by entering this command:
```
ACCELEROMETER_QUERY
```
- Something like this must be returned:
```
accelerometer values (x, y, z): 5551.544565, 7048.078582, -1924.535449
```
- Enter this command to measure the noise of the accelerometer for each axis:
```
MEASURE_AXES_NOISE
```
- You should get some baseline numbers for the noise of accelerometer on the axes (should be somewhere in the range of ~1-100). Too high axes noise (e.g. 1000 and more) can be indicative of the sensor issues, problems with its power, or too noisy imbalanced fans.

- To measure the resonances, see here: https://www.klipper3d.org/Measuring_Resonances.html

**Note:** After tests, it's better to disable the ADXL by commenting out the `[include adxl345_pico.cfg]` line again.

<br />

## Use ADXL345 with Fysetc Portable Input Shaper

You can use Fysetc Portable Input Shaper with FLSUN Speeder Pad for measuring Resonances via USB.

**Needed:**
- Fysetc Portable Input Shaper accelerometer available: [Here](https://fr.aliexpress.com/item/1005004555226273.html?spm=a2g0o.productlist.0.0.7e701327UZtVKE&algo_pvid=f25b0d36-5b57-4cbb-810d-40049619c920&algo_exp_id=f25b0d36-5b57-4cbb-810d-40049619c920-9&pdp_ext_f=%7B%22sku_id%22%3A%2212000029604437979%22%7D&pdp_npi=2%40dis%21EUR%2122.88%2119.68%21%21%21%21%21%402100bb5116668994876576555e3324%2112000029604437979%21sea&curPageLogUid=FMrXiSXrU6V9) 
- USB-A/Male to USB-C/Male Cable

**Note:** You can cut the yellow edges to reduce the width

<img src="https://user-images.githubusercontent.com/12702322/198383353-5e08d6dc-82d1-4491-b9ff-e9812d2ede15.jpg" width="500">

- Some dependencies are required to use this accelerometer, install them with this following commands (one at a time):
```
sudo apt update
```
```
sudo apt install python3-numpy python3-matplotlib libatlas-base-dev
```
- Followed by this command to install Numpy in Klipper's environment:
```
~/klippy-env/bin/pip install -v numpy
```
- It's also necessary to compile firmware for Fysetc Portable Input Shaper, enter the following commands (one at a time):
```
cd ~/klipper/
```
```
make menuconfig
```
- Select these settings:
![Capture d’écran 2022-12-12 à 03 17 31](https://user-images.githubusercontent.com/12702322/206946812-b862ebc9-0787-4951-9686-6d9c288c0375.jpg)

- Then on your keyboard press the `Q` key then `Y` to save configuration.

- Enter the following commands to compile firmware (one at a time):
```
make clean
```
```
make
```
- Plug Portable Input Shaper into one of the Speeder Pad's USB ports while holding down the button.

- Type this commands to flash firmware (one at a time):
```
cd ~ && sudo mount /dev/sda1 /mnt
```
```
sudo cp /home/pi/klipper/out/klipper.uf2 /mnt/
```
- Now disconnect and reconnect the accelerometer, without holding the button this time to restart it in normal mode.

- Then, type this command to retrieve the serial:
```
ls /dev/serial/by-id/*
```
- You should see 2 serials appear, one is your printer serial an other is the Fysetc Portable Input Shaper, the one with the mention `Klipper Rp2040`:

  <img src="https://user-images.githubusercontent.com/12702322/188280489-5db90d97-6f15-45a8-9f06-bd9da21b2cac.jpg" width="700">

- Go to your Mainsail Web interface then click on `Machine` tab.

- Open `adxl345_fysetc.cfg` file and edit following line with serial you have just obtained:
```
serial: /dev/serial/by-id/usb-Klipper_rp2040_E6605481DB318D34-if00
```
- Click on `SAVE & RESTART` at the top right to save the file.

- Then uncomment (remove the #) to the following line in the `printer.cfg` file to enable ADXL support:
```
[include adxl345_fysetc.cfg]
```
- Click on `SAVE & RESTART` at the top right to save the file.

- You should see the `PIS MCU` connecting to Klipper.

- You can test accelerometer by entering this command:
```
ACCELEROMETER_QUERY
```
- Something like this must be returned:
```
accelerometer values (x, y, z): 5551.544565, 7048.078582, -1924.535449
```
- Enter this command to measure the noise of the accelerometer for each axis:
```
MEASURE_AXES_NOISE
```
- You should get some baseline numbers for the noise of accelerometer on the axes (should be somewhere in the range of ~1-100). Too high axes noise (e.g. 1000 and more) can be indicative of the sensor issues, problems with its power, or too noisy imbalanced fans.

- To measure the resonances, see here: https://www.klipper3d.org/Measuring_Resonances.html

**Note:** After tests, it's better to disable the ADXL by commenting out the `[include adxl345_fysetc.cfg]` line again.

<br />

## Use Neopixels Ring Light

![Neopixels](https://user-images.githubusercontent.com/12702322/189089546-0705b277-79d4-4a16-bd79-75cb2c6bc493.png)

**Available modes:**

- Turn On Neopixels with `NEOPIXEL_ON` macro
- Turn Off Neopixels with `NEOPIXEL_OFF` macro
- Turn On Neopixels in blue with `NEOPIXEL_BLUE` macro
- Turn On Neopixels in red with `NEOPIXEL_RED` macro
- Turn On Neopixels in green with `NEOPIXEL_GREEN` macro
- Turn On Neopixels in yellow with `NEOPIXEL_YELLOW` macro
- Turn On Neopixels in orange with `NEOPIXEL_ORANGE` macro
- Turn On Neopixels in violet with `NEOPIXEL_VIOLET` macro
- Turn on Neopixels based on nozzle temperature (All LEDs) with `HOTEND_GLOW` macro
- Turn on Neopixels based on nozzle temperature (LED by LED) with `HOTEND_PROGRESS` macro
- Turn on Neopixels based on bed temperature (All LEDs) with `BED_GLOW` macro
- Turn on Neopixels based on bed temperature (LED by LED) with `BED_PROGRESS` macro
- Turn on Neopixels based on printing progress (All LEDs) with `PERCENT_GLOW` macro
- Turn on Neopixels based on printing progress (LED by LED) with `PERCENT_PROGRESS` macro
- Turn on Neopixels based on printing speed (All LEDs) with `SPEED_GLOW` macro
- Turn on Neopixels based on printing speed (LED by LED) with `SPEED_PROGRESS` macro

**Necessary:**

- Neon Flexible Tube 1m T1616-Side 10mm PCB: [Here](https://fr.aliexpress.com/item/4000095850068.html?spm=a2g0o.store_pc_allProduct.8148356.60.19667739Amjjs4&pdp_npi=2%40dis%21EUR%21%E2%82%AC%2013%2C34%21%E2%82%AC%209%2C34%21%21%21%21%21%402100bddd16626284472777282ed43e%2112000015942927508%21sh)

- LED Strip WS2812 1 m 60 IP 30: [Here](https://fr.aliexpress.com/item/4001322411818.html?spm=a2g0o.productlist.0.0.456f5656HRHoUB&algo_pvid=50309f27-48b8-4454-839b-91200ed7636a&algo_exp_id=50309f27-48b8-4454-839b-91200ed7636a-1&pdp_ext_f=%7B%22sku_id%22%3A%2212000029452067850%22%7D&pdp_npi=2%40dis%21EUR%215.33%213.52%21%21%21%21%21%40210318b816680797236251936e4806%2112000029452067850%21sea&curPageLogUid=B9A6EyfUBAps)

- Cable Ties 2.5mm

- Support (STL) : [Here](https://www.printables.com/model/272995-flsun-neopixels-ring-light-support)

<br />

**Wiring for V400 (MKS Robin Nano V2.0):**

<img src="https://user-images.githubusercontent.com/12702322/189106620-6ebc2983-be6f-4fb2-a36e-89bb4cd7e54b.png" width="600">

**Wiring for Super Racer (MKS Robin Nano V3.0/V3.1):**

<img src="https://user-images.githubusercontent.com/12702322/197017354-f78b9ec9-e959-41ba-b178-14a05bc11da8.png" width="600">

**Wiring for Super Racer (BigTreeTech SKR 1.3):**

<img src="https://user-images.githubusercontent.com/12702322/197060341-a616cc7e-d92d-47be-963e-61aeb41b734b.jpg" width="600">

**Wiring for Super Racer (BigTreeTech SKR 2.0):**

<img src="https://user-images.githubusercontent.com/12702322/219787859-237c8ffc-0716-4e8f-89ee-6b93883a558f.png" width="600">

**Configuration:**

- Go to your Mainsail Web interface then click on `Machine` tab.

- Then import the `KlipperScreen.conf` file located in `NeoPixels` folder of the pack (make sure you get the correct version V400 or Super Racer in the respective folders).

- Open the `printer.cfg` file and modify the following line by removing the `#` at the very beginning:
```
[include neopixels.cfg]  #Enable if you want to use Neopixels
```
- Once done, click on `SAVE & RESTART` at the top right to save the file.

<br />

## Enable Root Access

- Connect in SSH and enter the following command (you will need to enter your user password):
```
sudo -i
```
- Then enter this command to change root password:
```
passwd
```
- Enter a password twice for the root user.

- Then enter the following command:
```
sudo nano /etc/ssh/sshd_config
```
- Edit the file by replacing the line `#PermitRootLogin prohibit-password` by `PermitRootLogin yes`:

<img width="1303" alt="Capture d’écran 2023-03-15 à 22 17 24" src="https://user-images.githubusercontent.com/12702322/225756175-cd0c2eeb-a9b7-41da-ba88-8bd674ba6ab6.png">

- Then on your keyboard press the keys `Ctrl + X` to exit, `Y` to save and `Enter` to validate.

- Enter this command to apply change:
```
sudo service ssh restart
```

- Log out of the current SSH session.

- You can now login to SSH with `root` user rather than `pi`.

<br />

## Change SSH Welcome Message and Cleanup Files

This step allows you to change the SSH welcome message to obtain information about the system and to cleanup some files.

<img width="1302" alt="Capture d’écran 2023-03-17 à 21 54 copie" src="https://user-images.githubusercontent.com/12702322/226061601-92429fc2-8a7a-4e11-81e0-08b8cddcfa1d.png">

- Connect in SSH with root user and your password.

- In `root` folder create a new folder named `speeder_pad` by typing this command:
```
mkdir /root/speeder_pad
```
- Download this files pack and unzip it: <a href="https://github.com/Guilouz/Klipper-Flsun-Speeder-Pad/raw/main/Downloads/speeder_pad_files.7z" target="_blank">Speeder Pad Files</a>

- Drag and drop all files from the files pack to the `/root/speeder_pad/` folder.

- Then enter this commands (one at a time):
```
rm /etc/update-motd.d/00-header
```
```
rm /etc/update-motd.d/10-help-text
```
```
rm /etc/update-motd.d/50-motd-news
```
```
rm /etc/update-motd.d/60-unminimize
```
```
cp /root/speeder_pad/00-banner /etc/update-motd.d/
```
```
cp /root/speeder_pad/10-sysinfo /etc/update-motd.d/
```
```
cp /root/speeder_pad/colors /etc/update-motd.d/
```
```
chmod 755 /etc/update-motd.d/00-banner
```
```
chmod 755 /etc/update-motd.d/10-sysinfo
```
```
cp /root/speeder_pad/sshd_config /etc/ssh/
```
```
cp /root/speeder_pad/cfgguard.sh /usr/sbin/
```
```
service ssh restart
```
- You can now disconnect your SSH session and reconnect to see changes.

<br />

## Set a Static IP Address

Coming Soon...

<br />

## Change Boot Logo

Coming Soon...

<br />

## Special Thanks

- [FLSUN](https://flsun3d.com/) for sending me a free V400 and Speeder Pad.
- [digitalninja-ro](https://github.com/digitalninja-ro/klipper-neopixel) for Klipper NeoPixel Templates.
- [NERO 3D](https://www.youtube.com/channel/UCmV40QWkVeRs_nAvEOE_P-g) for his tips about Input Shaper with a Raspberry Pi Pico.
- [ManuMod](https://github.com/ManuMod) for his tips about symlink on USB-Disk folder.
- [Desuuuu](https://github.com/Desuuuu/klipper-macros) & [danorder](https://github.com/danorder) for the basics of some macros.
- [Jonny Lissoos](https://www.facebook.com/JonnyEL972) for his Timelapse instruction PDF.
- [Iago Diaz](https://www.facebook.com/iago.diaz.90) & [Mathieu Chantome](https://www.facebook.com/mathieu.chantome) for their tests.
- [AbomShep](https://github.com/AbomShep) for his tips to connect multiple printers on one board.
