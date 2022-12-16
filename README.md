 # FLSUN Speeder Pad Configurations

![Sans titre-2 copie](https://user-images.githubusercontent.com/12702322/196842330-e200350d-496f-4a1b-a8f7-1793d781dccb.jpg)

## Table of Contents

- [About](#about)
- [Repo Changelog](#repo-changelog)
- [Useful Links](#useful-links)
- [STL Files](#stl-files)
- [Restore OS Image File](#restore-os-image-file)
- [SSH Connection](#ssh-connection)
- [Change Password](#change-password)
- [Update Ubuntu dependencies](#update-ubuntu-dependencies)
- [Change Timezone](#change-timezone)
- [Change Wi-Fi Location](#change-wi-fi-location)
- [Delete Flsun Builds](#delete-flsun-builds)
- [Install Official Builds (1 instance)](#install-official-builds-1-instance)
- [Install Official Builds (3 instances)](#install-official-builds-3-instances)
- Update Motherboard Firmware
  - [Update V400 Motherboard Firmware (MKS Robin Nano V2.0)](#update-v400-motherboard-firmware-mks-robin-nano-v20)
  - [Update V400 Motherboard Firmware (BigTreeTech SKR 3.0)](#update-v400-motherboard-firmware-bigtreetech-skr-30)
  - [Update Super Racer Motherboard Firmware (MKS Robin Nano V3.0/V3.1)](#update-super-racer-motherboard-firmware-mks-robin-nano-v30v31)
  - [Update Super Racer Motherboard Firmware (BigTreeTech SKR 1.3)](#update-super-racer-motherboard-firmware-bigtreetech-skr-13)
- [Use Configurations](#use-configurations)
- [Get USB Serial from Motherboard](#get-usb-serial-from-motherboard)
- [Update KlipperScreen](#update-klipperscreen)
- [Improve Webcams Support](#improve-webcams-support)
- [Install and Update Timelapse](#install-and-update-timelapse)
- [Slicer Side Changes](#slicer-side-changes)
- [Calibrate your Printer](#calibrate-your-printer)
- [Use ADXL345 with Raspberry Pi Pico](#use-adxl345-with-raspberry-pi-pico)
- [Use ADXL345 with Fysetc Portable Input Shaper](#use-adxl345-with-fysetc-portable-input-shaper)
- [Use Neopixels Ring Light](#use-neopixels-ring-light)
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
- Fysetc Portable Input Shaper Mount for Super Racer : [Here](https://www.thingiverse.com/thing:5634625)

<br />

## Restore OS Image File

By default, Root access is not allowed on Speeder Pad. To enable it, follow these instructions to restore OS image file:

Note: A microSD card of at least 32 GB is required.

- Download this restoration image and unzip it: [Speeder Pad 1.1 Restoration Image](https://drive.google.com/file/d/1AK9RU-RRE33f7k3TYQ_7vIOV8tARfyd0/view?usp=sharing)

- Download and install Raspberry Pi Imager here: https://www.raspberrypi.com/software/

- Launch Raspberry Pi Imager:

![187550209-0614dc72-369c-4dbd-be49-226c02d87a56](https://user-images.githubusercontent.com/12702322/194968538-4aa44d04-9965-4a57-88c0-99a5deed1670.png)

- Select `Speeder_Pad_V1.1_Restoration-221019.xz` image file as `Operating System` by selecting `Use custom`.

- Select your microSD card as `Storage`.

- Then click `Write`.

- Once the image is written, turn off Speeder Pad if is on and remove all devices plugged into the USB ports.

- Insert microSD card in Speeder Pad and turn on it.

- A loading bar should appear:

![3](https://user-images.githubusercontent.com/12702322/196795418-12e3064a-59bd-4bfe-b326-036553e77808.png)

- And wait until the bar is fully charged and green, this may take several minutes (10/15 minutes):

![4](https://user-images.githubusercontent.com/12702322/196795445-4f680693-a39d-4f79-a605-bb0b380cf57c.png)

- When it's done, turn off Speeder Pad and remove the microSD card.

- Turn Speeder Pad back on, it should start normally and arrive on KlipperScreen splashscreen.

- Go to `Menu` --> `Network` and connect it to your WiFi network.

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

## Change Password

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

- In the SSH command prompt window, enter the following command to download updates list (you will need to enter the Root password):
```
sudo apt update
```
- Then this command to install all of them:
```
sudo apt full-upgrade
```
- Then remove not needed dependencies (one command at a time):
```
sudo apt remove --purge tailscale
sudo apt autoremove
sudo rm /etc/apt/sources.list.d/tailscale.list
sudo rm /usr/share/keyrings/tailscale-archive-keyring.gpg
sudo rm -rf /var/cache/tailscale
sudo apt autoclean
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
- To change the location enter the following command replacing `FR` by your country (you will need to enter the Root password):
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
- To make the location permanent, enter the following command replacing `FR` by your country (you will need to enter the Root password):
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

- In the SSH command prompt window, enter the following command:
```
sudo rm /home/pi/.gitconfig
```
- Then, enter the following command to install Kiauh:
```
git clone https://github.com/th33xitus/kiauh.git
```
- Launch Kiauh by entering this command:
```
./kiauh/kiauh.sh
```
- This window should appear:

![Capture d’écran 2022-12-12 à 02 16 15](https://user-images.githubusercontent.com/12702322/206941553-23be7162-0e73-43fa-a548-7011b231edd7.jpg)

- Enter in `3) [Remove]` menu by typing `3` then `Enter`:

![Capture d’écran 2022-12-12 à 02 17 02](https://user-images.githubusercontent.com/12702322/206941616-bc67ccbb-650d-43c4-ab77-a88044501e8a.jpg)

- Remove `7) [MJPG-Streamer]` by typing `7` then `Enter` (you will need to enter the Root password).

- Remove `5) [KlipperScreen]` by typing `5` then `Enter`.

- Remove `3) [Mainsail]` by typing `3` then `Enter`.

- Remove `2) [Moonraker]` by typing `2` then `Enter`.

- When it's done, remove `1) [Klipper]` by typing `1` then `Enter`.

- When it's done, go back to main menu by typing `B` then `Enter`.

- Exit Kiauh by typing `Q` then `Enter`.

- Enter the following commands (one at a time):
```
sudo rm -rf /home/pi/.moonraker_database_1 && rm -rf /home/pi/.moonraker_database_2 && rm -rf /home/pi/.moonraker_database_3
sudo rm -rf /home/pi/klipper_config
sudo rm -rf /home/pi/klipper_logs
sudo rm -rf /home/pi/moonraker-timelapse
sudo rm /home/pi/savedVariables1.cfg && rm /home/pi/savedVariables2.cfg && rm /home/pi/savedVariables3.cfg
```

<br />

## Install Official Builds (1 instance)

- Relaunch Kiauh by entering this command:
```
./kiauh/kiauh.sh
```
- Enter in `1) [Install]` menu by typing `1` then `Enter`:

![Capture d’écran 2022-12-12 à 02 18 22](https://user-images.githubusercontent.com/12702322/206941715-af819654-88af-4423-97ae-9299618b4e53.jpg)

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
git clone https://github.com/Guilouz/KlipperScreen-Flsun-Speeder-Pad.git
sudo mv /home/pi/KlipperScreen-Flsun-Speeder-Pad /home/pi/KlipperScreen
cd ~/KlipperScreen
./scripts/KlipperScreen-install.sh
```
Note: Installation may take several minutes.

- When it's done, enter this commands (one at a time):
```
cd ~
ln -s /home/pi/gcode_files/USB-Disk /home/pi/printer_data/gcodes/USB-Disk
sudo reboot
```
- Your Speeder Pad now running offical builds with 1 instance.

<br />

## Install Official Builds (3 instances)

- Relaunch Kiauh by entering this command:
```
./kiauh/kiauh.sh
```
- Enter in `1) [Install]` menu by typing `1` then `Enter`:

![Capture d’écran 2022-12-12 à 02 18 22](https://user-images.githubusercontent.com/12702322/206941715-af819654-88af-4423-97ae-9299618b4e53.jpg)

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
git clone https://github.com/Guilouz/KlipperScreen-Flsun-Speeder-Pad.git
sudo mv /home/pi/KlipperScreen-Flsun-Speeder-Pad /home/pi/KlipperScreen
cd ~/KlipperScreen
./scripts/KlipperScreen-install.sh
```
Note: Installation may take several minutes.

- When it's done, enter this commands (one at a time):
```
cd ~
ln -s /home/pi/gcode_files/USB-Disk /home/pi/printer_1_data/gcodes/USB-Disk
ln -s /home/pi/gcode_files/USB-Disk /home/pi/printer_2_data/gcodes/USB-Disk
ln -s /home/pi/gcode_files/USB-Disk /home/pi/printer_3_data/gcodes/USB-Disk
sudo reboot
```
- Your Speeder Pad now running offical builds with 3 instances.

<br />

## Update V400 Motherboard Firmware (MKS Robin Nano V2.0)

It's important that your motherboard firmware version matches with the installed Klipper version.

Version is visible on `System Loads` tile -> `mcu` section (in `Machine` tab).

To update firmware, follow these instructions:

- In the SSH command prompt window, enter the following commands (one at a time):
```
cd ~/klipper/
make menuconfig
```
- Select these settings:

![Capture d’écran 2022-12-12 à 02 59 51](https://user-images.githubusercontent.com/12702322/206945000-ec21cbf0-25ea-41dd-a5f1-26ee96732a77.jpg)

- Then on your keyboard press the `Q` key then `Y` to save configuration.

- Enter the following commands to compile firmware (one at a time):
```
make clean
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
make menuconfig
```
- Select these settings:
![Capture d’écran 2022-12-12 à 22 27 05](https://user-images.githubusercontent.com/12702322/207158189-83cac62b-dbed-475d-b9fa-edea571bf294.jpg)
- Then on your keyboard press the `Q` key then `Y` to save configuration.

- Enter the following commands to compile firmware (one at a time):
```
make clean
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
make menuconfig
```
- Select these settings:
![Capture d’écran 2022-12-12 à 03 05 15](https://user-images.githubusercontent.com/12702322/206945543-71505dac-830a-4c9a-8328-becd2deb5780.jpg)

- Then on your keyboard press the `Q` key then `Y` to save configuration.

- Enter the following commands to compile firmware (one at a time):
```
make clean
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
make menuconfig
```
- Select these settings:
![Capture d’écran 2022-12-12 à 03 11 55](https://user-images.githubusercontent.com/12702322/206946211-00f0fc3f-19ae-4ea7-8c57-3304cf25803e.jpg)

- Then on your keyboard press the `Q` key then `Y` to save configuration.

- Enter the following commands to compile firmware (one at a time):
```
make clean
make
```
- Super Racer motherboard doesn't support DFU mode, so it's not possible to install the firmware directly. It's therefore necessary to install it manually.

- Get the firmware named `klipper.bin` in `/home/pi/klipper/out/` directory (on the left part of MobaXterm).

- Rename it to `firmware.bin` and copy it to the root of an microSD card formatted in FAT32 and an allocation size of 4096.

- Insert the microSD card into the motherboard then turn on the printer.

- Installation only takes a few seconds, to verify that the firmware has been successfully installed, the file on the microSD card must have been renamed to `FIRMWARE.BIN.CUR`.

<br />

## Use Configurations

**In case you use 1 instance:**

- Download and unzip my repository zip file here: https://github.com/Guilouz/Klipper-Flsun-Speeder-Pad/archive/refs/heads/main.zip

- Go to your Mainsail Web interface then click on `Machine` tab.

- Then upload `KlipperScreen.conf`, `printer.cfg`, `macros.cfg`, `neopixels.cfg` and `adxl345.cfg` files located in `Configurations` directory according to your printer.

- Restart Speeder Pad and printer to take effect.

<br />

**In case you use 3 instances:**

- Download and unzip my repository zip file here: https://github.com/Guilouz/Klipper-Flsun-Speeder-Pad/archive/refs/heads/main.zip

- Go to your Mainsail Web interface then click on `Machine` tab.

- Then upload `KlipperScreen.conf`, `printer.cfg`, `macros.cfg`, `neopixels.cfg`, `adxl345_pico.cfg` and `adxl345_fysetc.cfg` files located in `Configurations` directory according to your printer.

- Open the `KlipperScreen.conf` file and edit it to enable multiple instance by removing the `#` symbols like this:

![Sans titre-1 copie](https://user-images.githubusercontent.com/12702322/197651386-5a33d848-0416-421a-871f-c25288c84d4d.jpg)

- Go to the Mainsail settings (gear at the top right of the interface) and select `PRINTERS` tab.

- Add as many printers as you have installed instances of Klipper/Moonraker by adding the IP address of your Pad and the port of each instance (The same IP addresses and ports obtained after installing Moonraker) like this:

![Sans titre-2 copie](https://user-images.githubusercontent.com/12702322/197652480-330ed03f-4820-4507-a0e1-755ce286ea44.jpg)

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

- Connect your printer to one of the Pad's USB ports.

- Connect in SSH then enter the following command to retrieve the motherboard USB serial:
```
ls /dev/serial/by-id/*
```
- You should see the USB serial appear like this (serial is different depending on the motherboard):

![Capture d’écran 2022-10-22 à 23 08 29](https://user-images.githubusercontent.com/12702322/197362963-65c93e37-1cd2-49d3-83d3-45a98450a44f.jpg)

- Go to your Mainsail Web interface then click on `Machine` tab.

- Open `printer.cfg` file and find `[mcu]` section.

- Edit the following existing line with serial you have just obtained like this:
```
serial: /dev/serial/by-id/usb-1a86_USB_Serial-if00-port0
```
- Click on `SAVE & RESTART` at the top right to save the file.

- Your printer should connect to your PAD.

<br />

## Update KlipperScreen

- Go to your Mainsail Web interface then select the `Machine` tab.

- Open the `moonraker.conf` file and add the following lines:
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

- You can now click the refresh button (still in the Machine tab) on the `Update Manager` tile.

- You will see a new KlipperScreen update appear, if you see a ⚠️DIRTY update, just select `Hard Recovery` to update.

![Update Manager](https://user-images.githubusercontent.com/12702322/183909392-24aab778-c8ed-4f81-be39-ac51612bf12c.jpg)

- Once installed you will have the new version of KlipperScreen and future updates will point directly to my repo like this:

![Update](https://user-images.githubusercontent.com/12702322/183990132-0a7673d1-2e51-484a-8113-e0bd54813995.jpg)

More info are available here: [KlipperScreen-Flsun-Speeder-Pad](https://github.com/Guilouz/KlipperScreen-Flsun-Speeder-Pad)

<br />

## Improve Webcams Support

It's possible to improve Webcams support and in particular the framerate by uninstalling mjpg-streamer and installing Crowsnest daemon (see [here](https://github.com/mainsail-crew/crowsnest) for more info).

<br />

**Installing Crowsnest:**

- Enter the following commands (one at a time):
```
cd ~
git clone https://github.com/mainsail-crew/crowsnest.git
cd ~/crowsnest
make config
```
- When asked to Continue select `Yes` by typing `Y` then `Enter`.

- When asked to specify path for config file (crowsnest.conf):
  - **For 1 instance:** You can press `Enter` directly
  - **For 3 instances type:** `/home/pi/printer_1_data/config`

- When asked to specify path for log file (crowsnest.logs):
  - **For 1 instance:** You can press `Enter` directly
  - **For 3 instances type:** `/home/pi/printer_1_data/logs`

- When asked to specify path for environment file (crowsnest.env):
  - **For 1 instance:** You can press `Enter` directly
  - **For 3 instances type:** `/home/pi/printer_1_data/systemd`

- When asked if Raspicam Fix should be applied select `No` by typing `N` then `Enter`.

- When asked to add Crowsnest Update Manager entry to moonraker.conf select `No` by typing `N` then `Enter`.

- Then enter this command to install:
```
sudo make install
```
- When asked to reboot NOW select `Yes` by typing `y` then `Enter`.

<br />

**Updating Crowsnest:**

- Go to your Mainsail Web interface then click on `Machine` tab.

- Open the `moonraker.conf` file and add the following lines:
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

![Capture d’écran 2022-10-29 à 21 46 51](https://user-images.githubusercontent.com/12702322/198850218-a8e12baf-f057-40c5-8203-9cf5ff7d1efa.jpg)

<br />


**Uninstalling Crowsnest:**

- If needed you can uninstall Crowsnest by entering the following commands (one at a time):
```
cd ~/crowsnest
make uninstall
sudo rm -rf /home/pi/crowsnest
```

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

## Install and Update Timelapse

- In the SSH command prompt window, enter the following commands (one at a time):

**In case you use 1 instance:**
```
cd ~/
git clone https://github.com/mainsail-crew/moonraker-timelapse.git
ln -sf "/home/pi/moonraker-timelapse/component/timelapse.py" "/home/pi/moonraker/moonraker/components/timelapse.py"
ln -sf "/home/pi/moonraker-timelapse/klipper_macro/timelapse.cfg" "/home/pi/printer_data/config/timelapse.cfg"
sudo apt install ffmpeg
sudo reboot
```

**In case you use 3 instances:**
```
cd ~/
git clone https://github.com/mainsail-crew/moonraker-timelapse.git
ln -sf "/home/pi/moonraker-timelapse/component/timelapse.py" "/home/pi/moonraker/moonraker/components/timelapse.py"
ln -sf "/home/pi/moonraker-timelapse/klipper_macro/timelapse.cfg" "/home/pi/printer_1_data/config/timelapse.cfg"
ln -sf "/home/pi/moonraker-timelapse/klipper_macro/timelapse.cfg" "/home/pi/printer_2_data/config/timelapse.cfg"
ln -sf "/home/pi/moonraker-timelapse/klipper_macro/timelapse.cfg" "/home/pi/printer_3_data/config/timelapse.cfg"
sudo apt install ffmpeg
sudo reboot
```

- Go to your Mainsail Web interface then click on `Machine` tab.

- Open the `moonraker.conf` file and add the following lines:
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

![Capture d’écran 2022-09-04 à 18 46 12](https://user-images.githubusercontent.com/12702322/188324381-3ab16337-e7da-4029-a318-ba41a4884ded.jpg)

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
 
 <br />

- Firmware retraction gives an advantage compared to Slicer retraction, it can be modified during a print (from Mainsail or KlipperScreen) and therefore the same gcode can be printed with different parameters without the need to be re-sliced.

  - For **Cura**, it's needed to install `Klipper Settings Plugin` (available here: [Klipper Settings Plugin](https://github.com/jjgraphix/KlipperSettingsPlugin)) and enable `Enable Firmware Retraction` setting like that:

  ![190531375-dc2def8d-9190-47c8-ae6e-bc7efaf2ce04](https://user-images.githubusercontent.com/12702322/197653257-9a4c29cc-64c0-4aa4-9077-32b30a9634d2.jpg)

  - For **PrusaSclicer / SuperSlicer**, you just need to enable `Use firmware retraction` setting like that:

![Capture d’écran 2022-12-12 à 03 21 47](https://user-images.githubusercontent.com/12702322/206947349-f522cf58-ce9f-4bd4-88a6-e73893efeaa3.jpg)
<br />

## Calibrate your Printer

This calibrations can be done by Mainsail Interface with Macros or on Speeder Pad directly.

- Start BED PID and save configuration.

- Start HOTEND PID and save configuration.

- Calibrate your extruder by calculing Rotation Distance.

- Start ENDSTOP CALIBRATION and save configuration.

- Start DELTA CALIBRATION and save configuration.

- Start BED LEVELING and save configuration.

- Adjust Z-OFFSET, first you need to move to Z=0 and then adjust nozzle position with a sheet of paper.
  - Note: The Z-Offset is saved in real time including when adjusting babysteps.

<br />

## Use ADXL345 with Raspberry Pi Pico

You can use ADXL345 with FLSUN Speeder Pad for measuring Resonances via USB with a Raspberry Pi Pico.

**Needed:**
- Raspberry Pi Pico
- ADXL345 Accelerometer
- USB-A/Male to Micro-USB/Male Cable
- Cable, tin and soldering iron

**Wiring:**
![ADXL345 Wiring](https://user-images.githubusercontent.com/12702322/188179060-33c3566d-80c7-4f19-8772-da85fd3704c4.png)

- Some dependencies are required to use ADXL345, install them with this following commands (one at a time):
```
sudo apt update
sudo apt install python3-numpy python3-matplotlib libatlas-base-dev
```
- Followed by this command to install Numpy in Klipper's environment:
```
~/klippy-env/bin/pip install -v numpy
```
- It's also necessary to compile firmware for Raspberry Pico, enter the following commands (one at a time):
```
cd ~/klipper/
make menuconfig
```
- Select these settings:
![Capture d’écran 2022-12-12 à 03 17 31](https://user-images.githubusercontent.com/12702322/206946770-d3ef1763-072e-48c8-8e48-7549f6dfd995.jpg)

- Then on your keyboard press the `Q` key then `Y` to save configuration.

- Enter the following commands to compile firmware (one at a time):
```
make clean
make
```
- Plug Raspberry Pi Pico into one of the Speeder Pad's USB ports while holding down the `BOOTSEL` button.

- Type this commands to flash firmware (one at a time):
```
cd ~
sudo mount /dev/sda1 /mnt
sudo cp /home/pi/klipper/out/klipper.uf2 /mnt/
sudo umount /mnt
```
- And now, type this command to retrieve the serial:
```
ls /dev/serial/by-id/*
```
- You should see 2 serials appear, that of the Raspberry Pi Pico is the one with the mention `Klipper_rp2040`:

![Capture d’écran 2022-09-03 à 18 48 39](https://user-images.githubusercontent.com/12702322/188280489-5db90d97-6f15-45a8-9f06-bd9da21b2cac.jpg)

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

![Capture d’écran 2022-10-27 à 21 40 08](https://user-images.githubusercontent.com/12702322/198383353-5e08d6dc-82d1-4491-b9ff-e9812d2ede15.jpg)

- Some dependencies are required to use this accelerometer, install them with this following commands (one at a time):
```
sudo apt update
sudo apt install python3-numpy python3-matplotlib libatlas-base-dev
```
- Followed by this command to install Numpy in Klipper's environment:
```
~/klippy-env/bin/pip install -v numpy
```
- It's also necessary to compile firmware for Raspberry Pico, enter the following commands (one at a time):
```
cd ~/klipper/
make menuconfig
```
- Select these settings:
![Capture d’écran 2022-12-12 à 03 17 31](https://user-images.githubusercontent.com/12702322/206946812-b862ebc9-0787-4951-9686-6d9c288c0375.jpg)

- Then on your keyboard press the `Q` key then `Y` to save configuration.

- Enter the following commands to compile firmware (one at a time):
```
make clean
make
```
- Plug Portable Input Shaper into one of the Speeder Pad's USB ports while holding down the button.

- Type this commands to flash firmware (one at a time):
```
cd ~
sudo mount /dev/sda1 /mnt
sudo cp /home/pi/klipper/out/klipper.uf2 /mnt/
sudo umount /mnt
```
- And now, type this command to retrieve the serial:
```
ls /dev/serial/by-id/*
```
- You should see 2 serials appear, that of the Fysetc Portable Input Shaper is the one with the mention `Klipper_rp2040`:

![Capture d’écran 2022-09-03 à 18 48 39](https://user-images.githubusercontent.com/12702322/188280489-5db90d97-6f15-45a8-9f06-bd9da21b2cac.jpg)

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

- Support (STL) : [Here](https://www.printables.com/model/272995-flsun-neopixels-ring-light-support)

<br />

**Wiring for V400 (MKS Robin Nano V2.0):**

![wiring](https://user-images.githubusercontent.com/12702322/189106620-6ebc2983-be6f-4fb2-a36e-89bb4cd7e54b.png)

**Wiring for Super Racer (MKS Robin Nano V3.0/V3.1):**

![wiring](https://user-images.githubusercontent.com/12702322/197017354-f78b9ec9-e959-41ba-b178-14a05bc11da8.png)

**Wiring for Super Racer (BigTreeTech SKR 1.3):**

![wiring](https://user-images.githubusercontent.com/12702322/197060341-a616cc7e-d92d-47be-963e-61aeb41b734b.jpg)


**Configuration:**

- Go to your Mainsail Web interface then click on `Machine` tab.

- Open the `printer.cfg` file and modify the following line by removing the `#` at the very beginning:
```
[include neopixels.cfg]  #Enable if you want to use Neopixels
```
- Now open the `KlipperScreen.conf` file and copy all of this code just before line `#~# --- Do not edit below this line. This section is auto generated --- #~#`:
```
[menu __main actions neopixels]
name: {{ gettext('Neopixels') }}
icon: neopixels

[menu __main actions neopixels led_off]
name: {{ gettext('Off') }}
icon: neopixels-off
method: printer.gcode.script
params: {"script":"NEOPIXEL_OFF"}

[menu __main actions neopixels led_on]
name: {{ gettext('On') }}
icon: neopixels-on
method: printer.gcode.script
params: {"script":"NEOPIXEL_ON"}

[menu __main actions neopixels led_blue]
name: {{ gettext('Blue') }}
icon: neopixels-blue
method: printer.gcode.script
params: {"script":"NEOPIXEL_BLUE"}

[menu __main actions neopixels led_red]
name: {{ gettext('Red') }}
icon: neopixels-red
method: printer.gcode.script
params: {"script":"NEOPIXEL_RED"}

[menu __main actions neopixels led_green]
name: {{ gettext('Green') }}
icon: neopixels-green
method: printer.gcode.script
params: {"script":"NEOPIXEL_GREEN"}

[menu __main actions neopixels led_yellow]
name: {{ gettext('Yellow') }}
icon: neopixels-yellow
method: printer.gcode.script
params: {"script":"NEOPIXEL_YELLOW"}

[menu __main actions neopixels led_orange]
name: {{ gettext('Orange') }}
icon: neopixels-orange
method: printer.gcode.script
params: {"script":"NEOPIXEL_ORANGE"}

[menu __main actions neopixels led_violet]
name: {{ gettext('Violet') }}
icon: neopixels-violet
method: printer.gcode.script
params: {"script":"NEOPIXEL_VIOLET"}

[menu __main actions neopixels hotend_glow]
name: {{ gettext('Hotend (All)') }}
icon: extruder
method: printer.gcode.script
params: {"script":"HOTEND_GLOW"}

[menu __main actions neopixels hotend_progress]
name: {{ gettext('Hotend (One by One)') }}
icon: extruder
method: printer.gcode.script
params: {"script":"HOTEND_PROGRESS"}

[menu __main actions neopixels bed_glow]
name: {{ gettext('Bed (All)') }}
icon: bed
method: printer.gcode.script
params: {"script":"BED_GLOW"}

[menu __main actions neopixels bed_progress]
name: {{ gettext('Bed (One by One)') }}
icon: bed
method: printer.gcode.script
params: {"script":"BED_PROGRESS"}

[menu __main actions neopixels percent_glow]
name: {{ gettext('Progress (All)') }}
icon: clock
method: printer.gcode.script
params: {"script":"PERCENT_GLOW"}

[menu __main actions neopixels percent_progress]
name: {{ gettext('Progress (One by One)') }}
icon: clock
method: printer.gcode.script
params: {"script":"PERCENT_PROGRESS"}

[menu __main actions neopixels speed_glow]
name: {{ gettext('Speed (All)') }}
icon: speed+
method: printer.gcode.script
params: {"script":"SPEED_GLOW"}

[menu __main actions neopixels speed_progress]
name: {{ gettext('Speed (One by One)') }}
icon: speed+
method: printer.gcode.script
params: {"script":"SPEED_PROGRESS"}

[menu __print neopixels]
name: {{ gettext('Neopixels') }}
icon: neopixels

[menu __print neopixels led_off]
name: {{ gettext('Off') }}
icon: neopixels-off
method: printer.gcode.script
params: {"script":"NEOPIXEL_OFF"}

[menu __print neopixels led_on]
name: {{ gettext('On') }}
icon: neopixels-on
method: printer.gcode.script
params: {"script":"NEOPIXEL_ON"}

[menu __print neopixels led_blue]
name: {{ gettext('Blue') }}
icon: neopixels-blue
method: printer.gcode.script
params: {"script":"NEOPIXEL_BLUE"}

[menu __print neopixels led_red]
name: {{ gettext('Red') }}
icon: neopixels-red
method: printer.gcode.script
params: {"script":"NEOPIXEL_RED"}

[menu __print neopixels led_green]
name: {{ gettext('Green') }}
icon: neopixels-green
method: printer.gcode.script
params: {"script":"NEOPIXEL_GREEN"}

[menu __print neopixels led_yellow]
name: {{ gettext('Yellow') }}
icon: neopixels-yellow
method: printer.gcode.script
params: {"script":"NEOPIXEL_YELLOW"}

[menu __print neopixels led_orange]
name: {{ gettext('Orange') }}
icon: neopixels-orange
method: printer.gcode.script
params: {"script":"NEOPIXEL_ORANGE"}

[menu __print neopixels led_violet]
name: {{ gettext('Violet') }}
icon: neopixels-violet
method: printer.gcode.script
params: {"script":"NEOPIXEL_VIOLET"}

[menu __print neopixels hotend_glow]
name: {{ gettext('Hotend (All)') }}
icon: extruder
method: printer.gcode.script
params: {"script":"HOTEND_GLOW"}

[menu __print neopixels hotend_progress]
name: {{ gettext('Hotend (One by One)') }}
icon: extruder
method: printer.gcode.script
params: {"script":"HOTEND_PROGRESS"}

[menu __print neopixels bed_glow]
name: {{ gettext('Bed (All)') }}
icon: bed
method: printer.gcode.script
params: {"script":"BED_GLOW"}

[menu __print neopixels bed_progress]
name: {{ gettext('Bed (One by One)') }}
icon: bed
method: printer.gcode.script
params: {"script":"BED_PROGRESS"}

[menu __print neopixels percent_glow]
name: {{ gettext('Progress (All)') }}
icon: clock
method: printer.gcode.script
params: {"script":"PERCENT_GLOW"}

[menu __print neopixels percent_progress]
name: {{ gettext('Progress (One by One)') }}
icon: clock
method: printer.gcode.script
params: {"script":"PERCENT_PROGRESS"}

[menu __print neopixels speed_glow]
name: {{ gettext('Speed (All)') }}
icon: speed+
method: printer.gcode.script
params: {"script":"SPEED_GLOW"}

[menu __print neopixels speed_progress]
name: {{ gettext('Speed (One by One)') }}
icon: speed+
method: printer.gcode.script
params: {"script":"SPEED_PROGRESS"}
```
- Once done, click on `SAVE & RESTART` at the top right to save the file.

<br />

## Special Thanks

- [FLSUN](https://flsun3d.com/) for sending me a free V400 and Speeder Pad.
- [digitalninja-ro](https://github.com/digitalninja-ro/klipper-neopixel) for Klipper NeoPixel Templates.
- [NERO 3D](https://www.youtube.com/channel/UCmV40QWkVeRs_nAvEOE_P-g) for his tips about Input Shaper with a Raspberry Pi Pico.
- [ManuMod](https://github.com/ManuMod) for his tips about symlink on USB-Disk folder.
- [Desuuuu](https://github.com/Desuuuu/klipper-macros) & [danorder](https://github.com/danorder) for the basics of some macros.
- [Jonny Lissoos](https://www.facebook.com/JonnyEL972) for his Timelapse instruction PDF.
- [Iago Diaz](https://www.facebook.com/iago.diaz.90) & [Mathieu Chantome](https://www.facebook.com/mathieu.chantome) for their tests.
