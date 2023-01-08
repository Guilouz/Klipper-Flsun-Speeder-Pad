# Configuration

## Download Configs

Download and unzip my repository zip file here: https://github.com/Guilouz/Klipper-Flsun-Speeder-Pad/archive/refs/heads/main.zip

Go to your Mainsail Web interface then click on `Machine` tab.

Then upload `KlipperScreen.conf`, `printer.cfg`, `macros.cfg`, `neopixels.cfg`, `adxl345_pico.cfg` and `adxl345_fysetc.cfg` files located in `Configurations` directory according to your printer.

Open the `KlipperScreen.conf` file and edit it to enable multiple instance by removing the `#` symbols like this:

![Sans titre-1 copie](https://user-images.githubusercontent.com/12702322/197651386-5a33d848-0416-421a-871f-c25288c84d4d.jpg)

Go to the Mainsail settings (gear at the top right of the interface) and select `PRINTERS` tab.

Add as many printers as you have installed instances of Klipper/Moonraker by adding the IP address of your Pad and the port of each instance (The same IP addresses and ports obtained after installing Moonraker) like this:

![Sans titre-2 copie](https://user-images.githubusercontent.com/12702322/197652480-330ed03f-4820-4507-a0e1-755ce286ea44.jpg)

You can now select `Printers` on left tab and switch to others printers.

You need to upload `printer.cfg`, `macros.cfg`, `neopixels.cfg`, `adxl345_pico.cfg` and `adxl345_fysetc.cfg` files for each printer.

Open `printer.cfg` file, find `[save_variables]` and `[virtual_sdcard]` sections and edit paths for each configured printer:

## Printer #1
```
[save_variables]
filename: ~/printer_1_data/config/variables.cfg

[virtual_sdcard]
path: ~/printer_1_data/gcodes
```

## Printer #2
```
[save_variables]
filename: ~/printer_2_data/config/variables.cfg

[virtual_sdcard]
path: ~/printer_2_data/gcodes
```

## Printer #3
```
[save_variables]
filename: ~/printer_3_data/config/variables.cfg

[virtual_sdcard]
path: ~/printer_3_data/gcodes
```

**Note:** Changes in the `KlipperScreen.conf` file only have an effect on the first configured printer, it's not needed on others.

Restart Speeder Pad and printer to take effect.

**Note:** You can select printer you want at startup on the screen. You can also enable `default_printer` setting in `KlipperScreen.conf` to start directly on printer you want and switch to others with shuffle button on the left side.

You now need to configure the Speeder Pad to talk to your Motherboard, continue at [USB Serial](../usb-serial.md).