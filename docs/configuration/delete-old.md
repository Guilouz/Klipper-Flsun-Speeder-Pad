# Delete Flsun Builds

To upgrade to official builds, follow these instructions:

In the SSH command prompt window, enter the following command:

```
sudo rm /home/pi/.gitconfig
```

## Install Kiauh

Then enter the following command to install Kiauh:

```
git clone https://github.com/th33xitus/kiauh.git
```

## Run Kiauh

Launch Kiauh by entering this command:

```
./kiauh/kiauh.sh
```

This window should appear:

![Capture d’écran 2022-12-12 à 02 16 15](https://user-images.githubusercontent.com/12702322/206941553-23be7162-0e73-43fa-a548-7011b231edd7.jpg)

## Remove Existing Configs

Enter in `3) [Remove]` menu by typing `3` then `Enter`:

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

To continue on, you must now decide how many printers you will connect to the Speeder Pad, if you only need one printer continue on at [Single Instance](single-instance/install.md), if you need multiple, then continue at [Multiple Instances](multiple-instances/install.md)