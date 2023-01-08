# Single Instance - Install Official Builds

Relaunch Kiauh by entering this command:

```
./kiauh/kiauh.sh
```

Enter in `1) [Install]` menu by typing `1` then `Enter`:

![Capture d’écran 2022-12-12 à 02 18 22](https://user-images.githubusercontent.com/12702322/206941715-af819654-88af-4423-97ae-9299618b4e53.jpg)

Install `1) [Klipper]` by typing `1` then `Enter`.

Select `1) [Python 3.x]  (recommended)` by typing `1` then `Enter`.

Then enter the number of Klipper instance by typing `1` and `Enter` to confirm:

![Capture d’écran 2022-12-12 à 01 57 02](https://user-images.githubusercontent.com/12702322/206940381-4ecf5d7f-a763-49c0-98f9-e7aee72b518f.jpg)

When it's done, install `2) [Moonraker]` by typing `2` then `Enter` and confirm by typing `Y`.

When it's done, install `3) [Mainsail]` by typing `3` then `Enter` and select no by typing `n` when asked to add the recommended macros.

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
ln -s /home/pi/gcode_files/USB-Disk /home/pi/printer_data/gcodes/USB-Disk
sudo reboot
```

Your Speeder Pad now running offical builds with 1 instance.

Now you should flash your printers motherboard, see [Firmware](../../firmware/index.md)