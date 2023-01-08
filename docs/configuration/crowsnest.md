# Crowsnest

It's possible to improve Webcams support and in particular the framerate by uninstalling mjpg-streamer and installing Crowsnest daemon (see [here](https://github.com/mainsail-crew/crowsnest) for more info).

## Installing Crowsnest

Enter the following commands (one at a time):

```
cd ~
git clone https://github.com/mainsail-crew/crowsnest.git
cd ~/crowsnest
make config
```

When asked to Continue select `Yes` by typing `Y` then `Enter`.

When asked to specify path for config file (crowsnest.conf):

- **For 1 instance:** You can press `Enter` directly
- **For 3 instances type:** `/home/pi/printer_1_data/config`

When asked to specify path for log file (crowsnest.logs):

- **For 1 instance:** You can press `Enter` directly
- **For 3 instances type:** `/home/pi/printer_1_data/logs`

When asked to specify path for environment file (crowsnest.env):

- **For 1 instance:** You can press `Enter` directly
- **For 3 instances type:** `/home/pi/printer_1_data/systemd`

When asked if Raspicam Fix should be applied select `No` by typing `N` then `Enter`.

When asked to add Crowsnest Update Manager entry to moonraker.conf select `No` by typing `N` then `Enter`.

Then enter this command to install:

```
sudo make install
```

When asked to reboot NOW select `Yes` by typing `y` then `Enter`.


## Updating Crowsnest

Go to your Mainsail Web interface then click on `Machine` tab.

Open the `moonraker.conf` file and add the following lines:

```
[update_manager crowsnest]
type: git_repo
path: ~/crowsnest
origin: https://github.com/mainsail-crew/crowsnest.git
managed_services: crowsnest
install_script: tools/install.sh
```

Once done, click on `SAVE & RESTART` at the top right to save the file.

You can now click the refresh button (still in the Machine tab) on the Update Manager tile.

You will see a new crowsnest line appear.

You can now configure your webcam (resolution, fps, focus etc...) by clicking on the `EDIT CROWSNEST.CONF` link in the `WEBCAMS` tab of Mainsail settings.

![Capture d’écran 2022-10-29 à 21 46 51](https://user-images.githubusercontent.com/12702322/198850218-a8e12baf-f057-40c5-8203-9cf5ff7d1efa.jpg)

## Uninstalling Crowsnest

If needed you can uninstall Crowsnest by entering the following commands (one at a time):

```
cd ~/crowsnest
make uninstall
sudo rm -rf /home/pi/crowsnest
```


## Add camera support on the Speeder Pad screen

Go to your Mainsail Web interface then click on `Machine` tab.

Open the `KlipperScreen.conf` file and and uncomment the line:

```
camera_url: http://127.0.0.1/webcam/?action=stream
```

Click on SAVE & RESTART at the top right to save the file.

A new `Camera` icon will appear in the `Actions` menu.

## Install and Update Timelapse

In the SSH command prompt window, enter the following commands (one at a time):

**In case you use 1 instance**

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

Go to your Mainsail Web interface then click on `Machine` tab.

Open the `moonraker.conf` file and add the following lines:

```
[timelapse]

[update_manager timelapse]
type: git_repo
primary_branch: main
path: ~/moonraker-timelapse
origin: https://github.com/mainsail-crew/moonraker-timelapse.git
managed_services: klipper moonraker
```

Once done, click on `SAVE & RESTART` at the top right to save the file.

You can now click the refresh button (still in the Machine tab) on the `Update Manager` tile.

You will see a new `timelapse` line appear.

![Capture d’écran 2022-09-04 à 18 46 12](https://user-images.githubusercontent.com/12702322/188324381-3ab16337-e7da-4029-a318-ba41a4884ded.jpg)

You now need to make changes to your Slicer, continue at [Slicer Changes](slicer-changes/start-end.md).