# Update KlipperScreen

Go to your Mainsail Web interface then select the `Machine` tab.

Open the `moonraker.conf` file and add the following lines:

```
[update_manager KlipperScreen]
type: git_repo
path: /home/pi/KlipperScreen
origin: https://github.com/Guilouz/KlipperScreen-Flsun-Speeder-Pad.git
env: /home/pi/.KlipperScreen-env/bin/python
requirements: scripts/KlipperScreen-requirements.txt
install_script: scripts/KlipperScreen-install.sh
```

Once done, click on `SAVE & RESTART` at the top right to save the file.

You can now click the refresh button (still in the Machine tab) on the `Update Manager` tile.

You will see a new KlipperScreen update appear, if you see a ⚠️DIRTY update, just select `Hard Recovery` to update.

![Update Manager](https://user-images.githubusercontent.com/12702322/183909392-24aab778-c8ed-4f81-be39-ac51612bf12c.jpg)

Once installed you will have the new version of KlipperScreen and future updates will point directly to my repo like this:

![Update](https://user-images.githubusercontent.com/12702322/183990132-0a7673d1-2e51-484a-8113-e0bd54813995.jpg)

More info are available here: [KlipperScreen-Flsun-Speeder-Pad](https://github.com/Guilouz/KlipperScreen-Flsun-Speeder-Pad).

Next is to install [Crowsnest](crowsnest.md).
