 # FLSUN Speeder Pad Configurations

![Sans titre-2 copie](https://user-images.githubusercontent.com/12702322/196842330-e200350d-496f-4a1b-a8f7-1793d781dccb.jpg)

## Table of Contents

- [About](#about)
- [Useful Information](#useful-information)
- [STL Files](#stl-files)
- [Enable Root Access](#enable-root-access)
- [SSH Connection](#ssh-connection)
- [Change Password](#change-password)
- [Update Ubuntu dependencies](#update-ubuntu-dependencies)
- [Change Timezone](#change-timezone)
- [Change Wi-Fi Location](#change-wi-fi-location)
- [Switch to Official Klipper Builds](#switch-to-official-klipper-builds)
- [Update V400 Motherboard Firmware](#update-v400-motherboard-firmware)
- [Update Super Racer Motherboard (Nano V3.0/V3.1) Firmware](#update-super-racer-motherboard-nano-v30v31-firmware)
- [Update Super Racer Motherboard (SKR 1.3) Firmware](#update-super-racer-motherboard-skr-13-firmware)
- [Update KlipperScreen](#update-klipperscreen)
- [Update Timelapse](#update-timelapse)
- [Use Configurations](#use-configurations)
- [Calibrate your Printer](#calibrate-your-printer)
- [Use Firmware Retraction](#use-firmware-retraction)
- [Use ADXL345](#use-adxl345)
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
- Configuration for ADXL345 via USB with Raspberry Pico
- Improved Start/End Gcodes
- And more...

<br />

Before using Klipper please read this documentations:

- Klipper (Operating System): https://www.klipper3d.org/
- Moonraker (API Web Server): https://moonraker.readthedocs.io/
- Mainsail (Web Interface): https://docs.mainsail.xyz/
- KlipperScreen (Screen Interface): https://klipperscreen.readthedocs.io/

<br />

## Useful Information

- To calibrate your extruder, see here: https://www.klipper3d.org/Rotation_Distance.html 

- To adjust Pressure Advance, see here: https://www.klipper3d.org/Pressure_Advance.html

- To adjust manually Resonance Compensation, see here: https://www.klipper3d.org/Resonance_Compensation.html

- To mesure Resonances with ADXL, see here: https://www.klipper3d.org/Measuring_Resonances.html

- To use Exclude Objects function, see here: https://docs.mainsail.xyz/features/exclude_objects

- To use Timelapse function, see here: https://github.com/mainsail-crew/moonraker-timelapse/blob/main/docs/configuration.md

- To display thumbnails on screen, see here: https://klipperscreen.readthedocs.io/en/latest/Thumbnails/

<br />

## STL Files

Many usefull STL for FLSUN Super Racer and V400 can be found on my profiles:

- Printables: [Here](https://www.printables.com/social/352655-guilouz/models)
- Thingiverse: [Here](https://www.thingiverse.com/guilouz/designs)

<br />

## Enable Root Access

By default, Root access is not allowed on Speeder Pad. To enable it, follow these instructions:

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

- Launch it then click on the `Session` icon then `SSH`:

![Capture d’écran 2022-08-31 à 00 27 15](https://user-images.githubusercontent.com/12702322/187554613-7c3b7776-2e9e-41cd-a331-9bcb29324e07.jpg)

![Capture d’écran 2022-08-31 à 00 28 03](https://user-images.githubusercontent.com/12702322/187554724-47adc66d-b76a-4351-8d81-c077c41072c2.jpg)

- Enter the IP address of your Speeder Pad in the `Remote Host` field, check the `Specify username` box and enter the username `pi` in the field then click on `OK`:

![Capture d’écran 2022-09-03 à 14 10 39](https://user-images.githubusercontent.com/12702322/188269957-c6e8fd1c-f9e1-44ed-86bf-6bd5ced24552.jpg)

- On the new displayed window, enter the password `flsun` (it's not displayed when typing, this is normal):

![Capture d’écran 2022-09-03 à 14 16 09](https://user-images.githubusercontent.com/12702322/188270050-8db7c386-dd59-49bb-ba04-ad8014766a2e.jpg)

- An authorization window will appear, authorize it. It's also possible that another window asking you to change the password will appear, ignore it.

- Once connected, on the left part of the window you have access to the folders and files of your Speeder Pad and on the right part to the SSH command prompt window:

![Capture d’écran 2022-09-03 à 14 20 15](https://user-images.githubusercontent.com/12702322/188270163-c9e24cf3-d11a-4870-bc0b-343b1bd32d61.jpg)

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
- You can view the available timezones by entering this command:
```
timedatectl list-timezones
```
- You can also find your timezone using this command (replace Paris with your nearest major city):
```
timedatectl list-timezones | grep -i Paris
```
- You can now set the new timezone with this command (replace Europe/Paris by the new timezone):
```
sudo timedatectl set-timezone Europe/Paris
```
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
<br />

- If you are experiencing Wifi disconnects, you can disable Power Save functionality with this command:
```
sudo nano /etc/NetworkManager/conf.d/default-wifi-powersave-on.conf
```
- On the page that appears, change the value to 2 instead of 3 as follows:
```
[connection]
wifi.powersave = 2
```
- Then press `Ctrl+X` to exit then `Y` to save and `Enter` to confirm.

- Enter this command to restart Wi-Fi service:
```
sudo service network-manager restart
```

<br />

## Switch to Official Klipper Builds

To upgrade to official builds, follow these instructions:

- In the SSH command prompt window, enter the following command to install Kiauh:
```
git clone https://github.com/th33xitus/kiauh.git
```
- Launch Kiauh by entering this command:
```
./kiauh/kiauh.sh
```
- This window should appear:

![Capture d’écran 2022-09-03 à 15 13 44](https://user-images.githubusercontent.com/12702322/188272063-58e8e06c-338a-42a1-abb0-5492dbe781c4.jpg)

- Enter in `3) [Remove]` menu by typing `3` then `Enter`:

![Capture d’écran 2022-09-03 à 15 26 31](https://user-images.githubusercontent.com/12702322/188272462-49994d56-11a7-438a-bbd8-f0511c36640d.jpg)

- Remove `5) [KlipperScreen]` by typing `5` then `Enter` (you will need to enter the Root password).

- Remove `3) [Mainsail]` by typing `3` then `Enter`.

- Remove `2) [Moonraker]` by typing `2` then `Enter`.

- When it's done, remove `1) [Klipper]` by typing `1` then `Enter`.

- When it's done, go back to main menu by typing `B` then `Enter`.

- Exit Kiauh by typing `Q` then `Enter`.

- Enter the following commands (one at a time):
```
sudo rm -rf /home/pi/.moonraker_database_1
sudo rm -rf /home/pi/.moonraker_database_2
sudo rm -rf /home/pi/.moonraker_database_3
sudo rm -rf /home/pi/gcode_files
sudo rm -rf /home/pi/klipper_config
sudo rm -rf /home/pi/klipper_logs
sudo rm /home/pi/.gitconfig
sudo rm /home/pi/savedVariables1.cfg
sudo rm /home/pi/savedVariables2.cfg
sudo rm /home/pi/savedVariables3.cfg
```
- Relaunch Kiauh by entering this command:
```
./kiauh/kiauh.sh
```
- Enter in `1) [Install]` menu by typing `1` then `Enter`:

![Capture d’écran 2022-09-03 à 15 39 18](https://user-images.githubusercontent.com/12702322/188273051-df392b33-ee7b-47d6-8166-f5be167b42f2.jpg)

- Install `1) [Klipper]` by typing `1` then `Enter`.

- Select `1) [Python 2.7]  (recommended)` by typing `1` then `Enter`.

- Then enter the number of Klipper instance by typing `1` then `Enter` and confirm by typing `Y`.

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

- When it's done, enter this command to reboot:
```
sudo reboot
```
- Your Speeder Pad now running offical builds.

<br />

## Update V400 Motherboard Firmware

It's important that your motherboard firmware version matches with the installed Klipper version.

Version is visible on `System Loads` tile -> `mcu` section (in `Machine` tab).

To update firmware, follow these instructions:

- In the SSH command prompt window, enter the following commands (one at a time):
```
cd ~/klipper/
make menuconfig
```
- Select these settings:
```
[*] Enable extra low-level configuration options
    Micro-controller Architecture (STMicroelectronics STM32)  --->
    Processor model (STM32F103)  --->
[ ] Only 10KiB of RAM (for rare stm32f103x6 variant)
[ ] Disable SWD at startup (for GigaDevice stm32f103 clones)
    Bootloader offset (28KiB bootloader)  --->
    Clock Reference (8 MHz crystal)  --->
    Communication interface (Serial (on USART3 PB11/PB10))  --->
(250000) Baud rate for serial port
()  GPIO pins to set at micro-controller startup
```

![Capture d’écran 2022-09-03 à 15 58 37](https://user-images.githubusercontent.com/12702322/188273866-1981aa1b-f01e-40c4-a8c4-4f1935adb821.jpg)

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

Note: Access to the microSD port of the motherboard being impossible as it is, because of the pneufit just in front, I modeled a new support available in `STL Files` section.

EDIT: On new V400 microSD port is now accessible, it's not needed to print a new support.

![1](https://user-images.githubusercontent.com/12702322/188274940-e660a798-93a0-495f-9cf0-842c3893f6d4.jpg)

I also recommend using a microSD extension for future updates to avoid removing the cover each time.

![PXL_20220830_171401777 jpg f3eeafe2288a0e0428950cfca7c5eec7](https://user-images.githubusercontent.com/12702322/188275110-b74b6cf9-ab33-403e-be87-4fcad06fa6f5.jpg)

<br />

## Update Super Racer Motherboard (Nano V3.0/V3.1) Firmware

It's important that your motherboard firmware version matches with the installed Klipper version.

Version is visible on `System Loads` tile -> `mcu` section (in `Machine` tab).

To update firmware, follow these instructions:

- In the SSH command prompt window, enter the following commands (one at a time):
```
cd ~/klipper/
make menuconfig
```
- Select these settings:
```
[*] Enable extra low-level configuration options
    Micro-controller Architecture (STMicroelectronics STM32)  --->
    Processor model (STM32F407)  --->
    Bootloader offset (48KiB bootloader (MKS Robin Nano V3))  --->
    Clock Reference (8 MHz crystal)  --->
    Communication interface (USB (on PA11/PA12))  --->
(250000) Baud rate for serial port
()  GPIO pins to set at micro-controller startup (NEW)
```

![Capture d’écran 2022-10-21 à 15 28 29](https://user-images.githubusercontent.com/12702322/197207233-cac4f384-0827-4ae0-ba58-44158240d989.jpg)

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

## Update Super Racer Motherboard (SKR 1.3) Firmware

It's important that your motherboard firmware version matches with the installed Klipper version.

Version is visible on `System Loads` tile -> `mcu` section (in `Machine` tab).

To update firmware, follow these instructions:

- In the SSH command prompt window, enter the following commands (one at a time):
```
cd ~/klipper/
make menuconfig
```
- Select these settings:
```
[*] Enable extra low-level configuration options
    Micro-controller Architecture (LPC176x (Smoothieboard))  --->
    Processor model (lpc1768 (100 MHz))  --->
[*] Target board uses Smoothieware bootloader (NEW)
    Communication interface (USB)  --->
    USB ids  --->
()  GPIO pins to set at micro-controller startup
```

![Capture d’écran 2022-10-20 à 22 31 36](https://user-images.githubusercontent.com/12702322/197057250-1b904584-57cc-4705-b753-37eacfa82764.jpg)

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

## Update KlipperScreen

- Go to your Mainsail Web interface then select the `Machine` tab.

- Right-click on the `moonraker.conf` file then `Download` to make a backup of the original file. Keep this file carefully for possible backtracking.

- Now, still on Mainsail, open the `moonraker.conf` file and modify the `[update_manager KlipperScreen]` section  as follows:
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

## Update Timelapse

- In the SSH command prompt window, enter the following commands (one at a time):
```
cd ~/
git clone https://github.com/mainsail-crew/moonraker-timelapse.git
bash /home/pi/moonraker-timelapse/install.sh -c /home/pi/printer_data/config
```
- Go to your Mainsail Web interface then click on `Machine` tab.

- Right-click on the `moonraker.conf` file then `Download` to make a backup of the original file. Keep this file carefully for possible backtracking.

- Now, still on Mainsail, open the `moonraker.conf` file and add the following lines:
```
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

## Use Configurations

- Download and unzip my repository zip file here: https://github.com/Guilouz/Klipper-Flsun-Speeder-Pad/archive/refs/heads/main.zip

- Go to your Mainsail Web interface then click on `Machine` tab.

- Then upload `KlipperScreen.conf`, `printer.cfg`, `macros.cfg`, `neopixels.cfg` and `adxl345.cfg` files located in `Configurations` directory according to your printer.

- Restart printer to take effect.

- Change your Start and End Gcode in your Slicer settings like this:

  - For **Cura**:
    - Start Gcode: `START_PRINT BED_TEMP={material_bed_temperature_layer_0} EXTRUDER_TEMP={material_print_temperature_layer_0}`
    - End Gcode: `END_PRINT`
    
  - For **PrusaSlicer** / **SuperSlicer**:
    - Start Gcode: `START_PRINT BED_TEMP=[first_layer_bed_temperature] EXTRUDER_TEMP=[first_layer_temperature]`
    - End Gcode: `END_PRINT`

<br />

## Calibrate your Printer

This calibrations can be done by Mainsail Interface with Macros or on Speeder Pad directly.

- Start BED PID and save configuration.

- Start HOTEND PID and save configuration.

- Start ENDSTOP CALIBRATION and save configuration.

- Start DELTA CALIBRATION and save configuration.

- Start BED LEVELING and save configuration.

- Adjust Z-OFFSET, first you need to move to Z=0 and then adjust nozzle position with a sheet of paper.
  - Note: The Z-Offset is saved in real time including when adjusting babysteps.

<br />

## Use Firmware Retraction

Firmware retraction gives an advantage compared to Slicer retraction, it can be modified during a print (from Mainsail or KlipperScreen) and therefore the same gcode can be printed with different parameters without the need to be re-sliced.

- For **Cura**, it's needed to install `Klipper Settings Plugin` (available here: [Klipper Settings Plugin](https://github.com/jjgraphix/KlipperSettingsPlugin)) and enable `Enable Firmware Retraction` setting like that:

![Capture d’écran 2022-09-16 à 02 27 23](https://user-images.githubusercontent.com/12702322/190531375-dc2def8d-9190-47c8-ae6e-bc7efaf2ce04.jpg)

- For **PrusaSclicer / SuperSlicer**, you just need to enable `Use firmware retraction` setting like that:

![Capture d’écran 2022-09-16 à 02 14 56](https://user-images.githubusercontent.com/12702322/190531620-fd64b261-1fc7-41f3-82de-96fba5ab8315.jpg)

<br />

## Use ADXL345

To use ADXL345 with FLSUN V400 for measuring Resonances it's necessary to use it via USB with a Raspberry Pi Pico.

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
```
[] Enable extra low-level configuration options
Micro-controller Architecture = (Raspberry Pi RP2040)
Communication interface = (USB)
```

![Capture d’écran 2022-09-03 à 18 28 10](https://user-images.githubusercontent.com/12702322/188279790-bba11b1c-16df-4e8e-bb80-e9400a1a4962.jpg)

- Then on your keyboard press the `Q` key then `Y` to save configuration.

- Enter the following commands to compile firmware (one at a time):
```
make clean
make
```
- Get the firmware named `klipper.uf2` in `/home/pi/klipper/out/` directory (on the left part of MobaXterm).

- Connect the Raspberry Pi Pico to the computer via USB while holding down the `BOOTSEL` button.

- Copy `klipper.uf2` file to the Raspberry Pico, it reboots as soon as it installs the firmware.

- Now plug it into one of the Speeder Pad's USB ports.

- Type this command to retrieve the serial:
```
ls /dev/serial/by-id/*
```
- You should see 2 serial appear, that of the Raspberry Pi Pico is the one with the mention `Klipper_rp2040`:

![Capture d’écran 2022-09-03 à 18 48 39](https://user-images.githubusercontent.com/12702322/188280489-5db90d97-6f15-45a8-9f06-bd9da21b2cac.jpg)

- Go to your Mainsail Web interface then click on `Machine` tab.

- Open `adxl345.cfg` file and edit following line with serial you have just obtained:
```
serial: /dev/serial/by-id/usb-Klipper_rp2040_E6605481DB318D34-if00
```
- Save and restart firmware.

- Then uncomment (remove the #) to the following line in the `printer.cfg` file to enable ADXL support:
```
[include adxl345.cfg]
```
- After saving and restarting the firmware you should see the ADXL MCU connecting to Klipper.

- To measure the resonances, see here: https://www.klipper3d.org/Measuring_Resonances.html

<br />

## Use Neopixels Ring Light

![Neopixels](https://user-images.githubusercontent.com/12702322/189089546-0705b277-79d4-4a16-bd79-75cb2c6bc493.png)

**Available modes:**

- Turn On Neopixels
- Turn Off Neopixels
- Turn On Neopixels in blue
- Turn On Neopixels in red
- Turn On Neopixels in green
- Turn On Neopixels in yellow
- Turn On Neopixels in orange
- Turn On Neopixels in violet
- Turn on Neopixels based on nozzle temperature (All LEDs)
- Turn on Neopixels based on nozzle temperature (LED by LED)
- Turn on Neopixels based on bed temperature (All LEDs)
- Turn on Neopixels based on bed temperature (LED by LED)
- Turn on Neopixels based on printing progress (All LEDs)
- Turn on Neopixels based on printing progress (LED by LED)
- Turn on Neopixels based on printing speed (All LEDs)
- Turn on Neopixels based on printing speed (LED by LED)

**Necessary:**

- Neon Flexible Tube 1m T1616-Side 10mm PCB: [Here](https://fr.aliexpress.com/item/4000095850068.html?spm=a2g0o.store_pc_allProduct.8148356.60.19667739Amjjs4&pdp_npi=2%40dis%21EUR%21%E2%82%AC%2013%2C34%21%E2%82%AC%209%2C34%21%21%21%21%21%402100bddd16626284472777282ed43e%2112000015942927508%21sh)

- LED Strip 1 m 60 IP 30: [Here](https://fr.aliexpress.com/item/32699391341.html?spm=a2g0o.store_pc_groupList.8148356.1.58d547644pkzbu&pdp_npi=2%40dis%21EUR%21%E2%82%AC%208%2C79%21%E2%82%AC%205%2C71%21%21%21%21%21%402100bdde16626287458333294e75cc%2112000026565180770%21sh)

- Support (STL) : [Here](https://www.printables.com/model/272995-flsun-neopixels-ring-light-support)

<br />

**Wiring for V400:**

![wiring](https://user-images.githubusercontent.com/12702322/189106620-6ebc2983-be6f-4fb2-a36e-89bb4cd7e54b.png)

**Wiring for Super Racer (Nano V3.0/V3.1):**

![wiring](https://user-images.githubusercontent.com/12702322/197017354-f78b9ec9-e959-41ba-b178-14a05bc11da8.png)

**Wiring for Super Racer (SKR 1.3):**

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

- [FLSUN](https://flsun3d.com/) for for sending me a free V400 and Speeder Pad.
- [digitalninja-ro](https://github.com/digitalninja-ro/klipper-neopixel) for Klipper NeoPixel Templates.
- [Desuuuu](https://github.com/Desuuuu/klipper-macros) & [danorder](https://github.com/danorder) for the basics of some macros.
- [Iago Diaz](https://www.facebook.com/iago.diaz.90) & [Mathieu Chantome](https://www.facebook.com/mathieu.chantome) for their tests.
