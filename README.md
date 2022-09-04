# Klipper Configuration for FLSUN V400

![test-flsun-v400 jpg 3683ed2615cedff6a17e282b2dc48190 thumb jpg c579e0706751042e9e214feb12a7c162](https://user-images.githubusercontent.com/12702322/183767560-330689f3-61f6-42d3-9daf-b6c3e6ff845a.jpg)

Klipper is a 3d-Printer firmware. It combines the power of a general purpose computer with one or more micro-controllers.

See the [features document](https://www.klipper3d.org/Features.html) for more information on why you should use Klipper.


## Table of Contents

- [About](#about)
- [STL Files](#stl-files)
- [Enable Root Access](#enable-root-access)
- [SSH Connection](#ssh-connection)
- [Change Password](#change-password)
- [Change Timezone](#change-timezone)
- [Change Wi-Fi Location](#change-wi-fi-location)
- [Switch to Official Klipper Builds](#switch-to-official-klipper-builds)
- [Update Mainsail](#update-mainsail)
- [Update Timelapse](#update-timelapse)
- [Update Motherboard Firmware](#update-motherboard-firmware)
- [Use Configurations](#use-configurations)
- [Calibrate your Printer](#calibrate-your-printer)
- [Use ADXL345](#use-adxl345)
- [Special Thanks](#special-thanks)

<br />

## About

This configuration is compatible with FLSUN V400 only.

- Improved settings (drivers current, microsteps, bed leveling and more...)
- Added useful and automated macros with notifications to KlipperScreen
- Added configuration for ADXL345 via USB with Raspberry Pico
- Improved Start/End Gcodes

Updated Klipperscreen version for V400 is also available here : [KlipperScreen-Flsun-V400](https://github.com/Guilouz/KlipperScreen-Flsun-V400)

<br />

If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂

[ ![Download](https://user-images.githubusercontent.com/12702322/115148445-e5a40100-a05f-11eb-8552-c1f5d4355987.png) ](https://www.paypal.me/CyrilGuislain)

<br />

## STL Files

- Motherboard Mount for Easy Access to microSd port : https://www.printables.com/model/268464-flsun-v400-motherboard-mount
- ADXL345 Mount : https://www.printables.com/model/268463-flsun-v400-adxl345-mount
- FLSUN V400 Fanduct : https://www.printables.com/model/268456-flsun-v400-fanduct

<br />

## Enable Root Access

By default, root access is not allowed on Speeder Pad. To enable it, follow these instructions:

- Download this pack and unzip it : [Root Access Enabler.zip](https://github.com/Guilouz/Klipper-Flsun-V400/files/9482488/Root.Access.Enabler.zip)

- Copy `update.sh` file to the root of USB stick provided with V400.

- Printer off, insert the USB stick into one of the ports of the Speeder Pad.

- Turn on the printer and wait for it to start. Once it has restarted, you can remove the USB stick.

- You now have Root access for user `pi`.

- To prevent the script from running on every boot, delete the `update.sh` file and the newly created `update.over` file from the USB stick.

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

- An authorization window will appear, authorize it. It is also possible that another window asking you to change the password will appear, ignore it.

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
  - **Note: You’ll not be able to see any characters on the display while entering the password. So, don’t panic; just type in your password and press `Enter`.**

- Once you’ve successfully verified your password, it’ll get applied right away.

<br />

## Change Timezone

By default, V400 are on Asia timezone. To change that, follow these instructions:

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
- Then unlink the current timezone with this command (you will need to enter the Root password):
```
sudo unlink /etc/localtime
```
- You can now set the new timezone with this command (replace Europe/Paris by the new timezone):
```
sudo ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
```
- You can then verify that the change has been taken into account by retyping this command:
```
timedatectl
```

<br />

## Change Wi-Fi Location

By default, there is no location defined.

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
sudo nano /usr/share/zoneinfo/zone.tab
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

By default, FLSUN does not use builds from official GitHub repositories. Updates point to Gitee repositories which are very slow, sometimes inaccessible and not updated.
In addition, during Delta Calibration, tower angles and delta radius are never recalculated in their Klipper build, which can cause several issues.

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

- Remove `2) [Moonraker]` by typing `2` then `Enter` (you will need to enter the Root password).

- When it's done, remove `1) [Klipper]` by typing `1` then `Enter` (you will need to enter the Root password).

- When it's done, go back to main menu by typing `B` then `Enter`.

- Enter in `1) [Install]` menu by typing `1` then `Enter`:

![Capture d’écran 2022-09-03 à 15 39 18](https://user-images.githubusercontent.com/12702322/188273051-df392b33-ee7b-47d6-8166-f5be167b42f2.jpg)

- Install `1) [Klipper]` by typing `1` then `Enter` (you will need to enter the Root password).

- When it's done, install `2) [Moonraker]` by typing `2` then `Enter` (you will need to enter the Root password).

- When it's done, go back to main menu by typing `B` then `Enter`.

- Exit Kiauh by typing `Q` then `Enter`.

- Your Speeder Pad now running offical builds of Klipper and Moonraker.

Note: You can also install Fluidd if you don't like the Mainsail interface.

<br />

## Update Mainsail

- Go to your Mainsail Web interface then click on `Machine` tab.

- Right-click on the `moonraker.conf` file then `Download` to make a backup of the original file. Keep this file carefully for possible backtracking.

- Now, still on Mainsail, open the `moonraker.conf` file and add the following lines:
```
[update_manager client mainsail]
type: web
channel: stable
repo: mainsail-crew/mainsail
path: ~/mainsail
```
- Once done, click on `Save & close` at the top right to save the file.

- You can now click the refresh button (still in the Machine tab) on the `Update Manager` tile.

- You will see a new `mainsail` line appear.

![Capture d’écran 2022-09-03 à 15 49 16](https://user-images.githubusercontent.com/12702322/188273402-84c3c399-5c88-4d6f-82e2-3bd9b134dbd7.jpg)

<br />

## Update Timelapse

- In the SSH command prompt window, enter the following command:
```
bash ~/moonraker-timelapse/install.sh
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
- Once done, click on `Save & close` at the top right to save the file.

- You can now click the refresh button (still in the Machine tab) on the `Update Manager` tile.

- You will see a new `timelapse` line appear.

![Capture d’écran 2022-09-04 à 18 46 12](https://user-images.githubusercontent.com/12702322/188324381-3ab16337-e7da-4029-a318-ba41a4884ded.jpg)

<br />

## Update Motherboard Firmware

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
Micro-controller Architecture (STMicroelectronics STM32)
Processor model (STM32F103)
Bootloader offset (28KiB bootloader)
Clock Reference (8 MHz crystal)
Communication interface (Serial (on USART3 PB11/PB10))
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

- Installation only takes a few seconds, to verify that the firmware has been successfully installed, the file on the microSD card must have been renamed to `ROBIN_NANO35.BIN.CUR` and the version on the `System Loads` tile must have been changed.

Note: Access to the microSD port of the motherboard being impossible as it is, because of the pneufit just in front, I modeled a new support available in `STL Files` section.

![1](https://user-images.githubusercontent.com/12702322/188274940-e660a798-93a0-495f-9cf0-842c3893f6d4.jpg)

I also recommend using a microSD extension for future updates to avoid removing the cover each time.

![PXL_20220830_171401777 jpg f3eeafe2288a0e0428950cfca7c5eec7](https://user-images.githubusercontent.com/12702322/188275110-b74b6cf9-ab33-403e-be87-4fcad06fa6f5.jpg)

<br />

## Use Configurations

- Go to your Mainsail Web interface then click on `Machine` tab.

- Right-click on the `printer.cfg` file then `Download` to make a backup of the original file. Keep this file carefully for possible backtracking.

- Download and unzip my repository zip file here : https://github.com/Guilouz/Klipper-Flsun-V400/archive/refs/heads/main.zip

- Then upload `printer.cfg`, `macros.cfg` and `adxl345.cfg` files located in `Configurations` directory.

- Restart printer to take effect.

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

- To calibrate your extruder, see here: https://www.klipper3d.org/Rotation_Distance.html 

- To adjust Pressure Advance, see here: https://www.klipper3d.org/Pressure_Advance.html

- To adjust manually Resonance Compensation, see here: https://www.klipper3d.org/Resonance_Compensation.html


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

## Special Thanks

- https://www.lesimprimantes3d.fr/ for some photos and Root Access Enabler.
