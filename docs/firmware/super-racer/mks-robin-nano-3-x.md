# Update Super Racer Motherboard Firmware (MKS Robin Nano V3.0/V3.1)

It's important that your motherboard firmware version matches with the installed Klipper version.

Version is visible on `System Loads` tile -> `mcu` section (in `Machine` tab).

To update firmware, follow these instructions:

In the SSH command prompt window, enter the following commands (one at a time):

```
cd ~/klipper/
make menuconfig
```

Select these settings:

![Capture d’écran 2022-12-12 à 03 05 15](https://user-images.githubusercontent.com/12702322/206945543-71505dac-830a-4c9a-8328-becd2deb5780.jpg)

Then on your keyboard press the `Q` key then `Y` to save configuration.

Enter the following commands to compile firmware (one at a time):

```
make clean
make
```

Super Racer motherboard doesn't support DFU mode, so it's not possible to install the firmware directly. It's therefore necessary to install it manually.

Get the firmware named `klipper.bin` in `/home/pi/klipper/out/` directory (on the left part of MobaXterm).

Rename it to `Robin_nano_v3.bin` and copy it to the root of an microSD card formatted in FAT32 and an allocation size of 4096.

Insert the microSD card into the motherboard then turn on the printer.

Installation only takes a few seconds, to verify that the firmware has been successfully installed, the file on the microSD card must have been renamed to `ROBIN_NANO_V3.BIN.CUR`.

Once this is complete, you should continue at either [Single Instance Configuration](../../configuration/single-instance/configure.md) or [Multiple Instance Configuration](../../configuration/multiple-instances/configure.md).