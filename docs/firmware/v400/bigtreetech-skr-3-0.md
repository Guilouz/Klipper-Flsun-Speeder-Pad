# Update V400 Motherboard Firmware (BigTreeTech SKR 3.0)

**Note:** Wiring for BigTreeTech SKR 3.0 is available [here](https://github.com/Guilouz/Klipper-Flsun-Speeder-Pad/blob/main/Configurations/FLSUN%20V400/FLSUN%20V400%20-%20BigTreeTech%20SKR%203.0%20Wiring.png?raw=true) 

It's important that your motherboard firmware version matches with the installed Klipper version.

Version is visible on `System Loads` tile -> `mcu` section (in `Machine` tab).

To update firmware, follow these instructions:

In the SSH command prompt window, enter the following commands (one at a time):

```
cd ~/klipper/
make menuconfig
```

Select these settings:

![Capture d’écran 2022-12-12 à 22 27 05](https://user-images.githubusercontent.com/12702322/207158189-83cac62b-dbed-475d-b9fa-edea571bf294.jpg)

Then on your keyboard press the `Q` key then `Y` to save configuration.

Enter the following commands to compile firmware (one at a time):

```
make clean
make
```

Get the firmware named `klipper.bin` in `/home/pi/klipper/out/` directory (on the left part of MobaXterm).

Rename it to `firmware.bin` and copy it to the root of an microSD card formatted in FAT32 and an allocation size of 4096.

Insert the microSD card into the motherboard then turn on the printer.

Installation only takes a few seconds, to verify that the firmware has been successfully installed, the file on the microSD card must have been renamed to `FIRMWARE.BIN.CUR`.

**Note:** For future Klipper firmware updates, it's possible to directly flash the firmware via SSH.

USB serial is needed for this, you can retrieve it by following this step: [Get USB Serial from Motherboard](#get-usb-serial-from-motherboard)

In the SSH command prompt window, enter the following command:

```
make flash FLASH_DEVICE=/dev/serial/by-id/XXXXX (replacing the XXXXX with the serial obtained previously)
```

It should look like this:

```
make flash FLASH_DEVICE=/dev/serial/by-id/usb-Klipper_stm32h743xx_39004C001251303232383230-if00
```

There will be a `dfu-util: Error during download get_status` error message after the update. Don't pay attention to it, the most important thing is to get the green line `File downloaded successfully`.

Once this is complete, you should continue at either [Single Instance Configuration](../../configuration/single-instance/configure.md) or [Multiple Instance Configuration](../../configuration/multiple-instances/configure.md).