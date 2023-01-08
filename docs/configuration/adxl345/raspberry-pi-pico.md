# Use ADXL345 with Raspberry Pi Pico

You can use ADXL345 with FLSUN Speeder Pad for measuring Resonances via USB with a Raspberry Pi Pico.

## Requirements

- Raspberry Pi Pico
- ADXL345 Accelerometer
- USB-A/Male to Micro-USB/Male Cable
- Cable, tin and soldering iron

## Wiring

![ADXL345 Wiring](https://user-images.githubusercontent.com/12702322/188179060-33c3566d-80c7-4f19-8772-da85fd3704c4.png)

## Dependencies

Some dependencies are required to use ADXL345, install them with this following commands (one at a time):

```
sudo apt update
sudo apt install python3-numpy python3-matplotlib libatlas-base-dev
```

Followed by this command to install Numpy in Klipper's environment:

```
~/klippy-env/bin/pip install -v numpy
```

## Compile

It's also necessary to compile firmware for Raspberry Pico, enter the following commands (one at a time):

```
cd ~/klipper/
make menuconfig
```

Select these settings:

![Capture d’écran 2022-12-12 à 03 17 31](https://user-images.githubusercontent.com/12702322/206946770-d3ef1763-072e-48c8-8e48-7549f6dfd995.jpg)

Then on your keyboard press the `Q` key then `Y` to save configuration.

Enter the following commands to compile firmware (one at a time):

```
make clean
make
```

## Flash

Plug Raspberry Pi Pico into one of the Speeder Pad's USB ports while holding down the `BOOTSEL` button.

Type this commands to flash firmware (one at a time):

```
cd ~
sudo mount /dev/sda1 /mnt
sudo cp /home/pi/klipper/out/klipper.uf2 /mnt/
sudo umount /mnt
```

## Config

And now, type this command to retrieve the serial:

```
ls /dev/serial/by-id/*
```

You should see 2 serials appear, that of the Raspberry Pi Pico is the one with the mention `Klipper_rp2040`:

![Capture d’écran 2022-09-03 à 18 48 39](https://user-images.githubusercontent.com/12702322/188280489-5db90d97-6f15-45a8-9f06-bd9da21b2cac.jpg)

Go to your Mainsail Web interface then click on `Machine` tab.

Open `adxl345_pico.cfg` file and edit following line with serial you have just obtained:

```
serial: /dev/serial/by-id/usb-Klipper_rp2040_E6605481DB318D34-if00
```

Click on `SAVE & RESTART` at the top right to save the file.

Then uncomment (remove the #) to the following line in the `printer.cfg` file to enable ADXL support:

```
[include adxl345_pico.cfg]
```

Click on `SAVE & RESTART` at the top right to save the file.

You should see the `ADXL MCU` connecting to Klipper.

## Test

You can test accelerometer by entering this command:

```
ACCELEROMETER_QUERY
```

Something like this must be returned:

```
accelerometer values (x, y, z): 5551.544565, 7048.078582, -1924.535449
```

## Run

Enter this command to measure the noise of the accelerometer for each axis:

```
MEASURE_AXES_NOISE
```

You should get some baseline numbers for the noise of accelerometer on the axes (should be somewhere in the range of ~1-100). Too high axes noise (e.g. 1000 and more) can be indicative of the sensor issues, problems with its power, or too noisy imbalanced fans.

To measure the resonances, see here: https://www.klipper3d.org/Measuring_Resonances.html

**Note:** After tests, it's better to disable the ADXL by commenting out the `[include adxl345_pico.cfg]` line again.
