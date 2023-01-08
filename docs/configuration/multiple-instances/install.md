# Multiple Instances - Install Official Builds

Relaunch Kiauh by entering this command:

```
./kiauh/kiauh.sh
```

Enter in `1) [Install]` menu by typing `1` then `Enter`:

![Capture d’écran 2022-12-12 à 02 18 22](https://user-images.githubusercontent.com/12702322/206941715-af819654-88af-4423-97ae-9299618b4e53.jpg)

Install `1) [Klipper]` by typing `1` then `Enter`.

Select `1) [Python 3.x]  (recommended)` by typing `1` then `Enter`.

Then enter the number of Klipper instances by typing `3` and `Enter` to confirm:

![Capture d’écran 2022-12-12 à 02 23 50](https://user-images.githubusercontent.com/12702322/206942150-f6ec553f-e44d-4b95-8cc4-afb715d8c659.jpg)

When asked to assign custom names, select NO by typing `N` then `Enter`:

![Capture d’écran 2022-12-12 à 02 26 10](https://user-images.githubusercontent.com/12702322/206942312-2992495b-956c-48ec-8a68-68bc5aeb9bd6.jpg)

When it's done, install `2) [Moonraker]` by typing `2` then `Enter` and confirm by typing `Y`.

Then enter the number of Moonraker instances by typing `3` then `Enter` and confirm by typing `Y`:

![Capture d’écran 2022-12-12 à 02 34 51](https://user-images.githubusercontent.com/12702322/206942863-61f55f6a-a8c8-4234-b3cc-cfca87e6ccfa.jpg)

When it's done, you get your 3 instances with their IP addresses and ports, write them down they will be useful later:

![Capture d’écran 2022-12-12 à 02 44 04](https://user-images.githubusercontent.com/12702322/206943753-4f871a6b-0917-4096-9dc9-0801eae58892.jpg)

Install `3) [Mainsail]` by typing `3` then `Enter` and select no by typing `n` when asked to add the recommended macros.

When it's done, go back to main menu by typing `B` then `Enter`.

Exit Kiauh by typing `Q` then `Enter`.

Enter the following commands (one at a time) to install KlipperScreen:

```
git clone https://github.com/Guilouz/KlipperScreen-Flsun-Speeder-Pad.git
sudo mv /home/pi/KlipperScreen-Flsun-Speeder-Pad /home/pi/KlipperScreen
cd ~/KlipperScreen
./scripts/KlipperScreen-install.sh
```

Note: Installation may take several minutes.

When it's done, enter this commands (one at a time):

```
cd ~
ln -s /home/pi/gcode_files/USB-Disk /home/pi/printer_1_data/gcodes/USB-Disk
ln -s /home/pi/gcode_files/USB-Disk /home/pi/printer_2_data/gcodes/USB-Disk
ln -s /home/pi/gcode_files/USB-Disk /home/pi/printer_3_data/gcodes/USB-Disk
sudo reboot
```

Your Speeder Pad now running offical builds with 3 instances.

Now you should flash your printers motherboard, see [Firmware](../../firmware/index.md)