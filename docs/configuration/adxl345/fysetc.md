# Use ADXL345 with Fysetc Portable Input Shaper

You can use Fysetc Portable Input Shaper with FLSUN Speeder Pad for measuring Resonances via USB.

## Requirements

- Fysetc Portable Input Shaper accelerometer available: [Here](https://fr.aliexpress.com/item/1005004555226273.html?spm=a2g0o.productlist.0.0.7e701327UZtVKE&algo_pvid=f25b0d36-5b57-4cbb-810d-40049619c920&algo_exp_id=f25b0d36-5b57-4cbb-810d-40049619c920-9&pdp_ext_f=%7B%22sku_id%22%3A%2212000029604437979%22%7D&pdp_npi=2%40dis%21EUR%2122.88%2119.68%21%21%21%21%21%402100bb5116668994876576555e3324%2112000029604437979%21sea&curPageLogUid=FMrXiSXrU6V9) 
- USB-A/Male to USB-C/Male Cable

**Note:** You can cut the yellow edges to reduce the width

![Capture d’écran 2022-10-27 à 21 40 08](https://user-images.githubusercontent.com/12702322/198383353-5e08d6dc-82d1-4491-b9ff-e9812d2ede15.jpg)

## Dependencies

Some dependencies are required to use this accelerometer, install them with this following commands (one at a time):

```
sudo apt update
sudo apt install python3-numpy python3-matplotlib libatlas-base-dev
```

Followed by this command to install Numpy in Klipper's environment:

```
~/klippy-env/bin/pip install -v numpy
```

## Compile

It's also necessary to compile firmware for Fysetc Portable Input Shaper, enter the following commands (one at a time):

```
cd ~/klipper/
make menuconfig
```

Select these settings:

![Capture d’écran 2022-12-12 à 03 17 31](https://user-images.githubusercontent.com/12702322/206946812-b862ebc9-0787-4951-9686-6d9c288c0375.jpg)

Then on your keyboard press the `Q` key then `Y` to save configuration.

Enter the following commands to compile firmware (one at a time):

```
make clean
make
```

## Flash

Plug Portable Input Shaper into one of the Speeder Pad's USB ports while holding down the button.

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

You should see 2 serials appear, that of the Fysetc Portable Input Shaper is the one with the mention `Klipper_rp2040`:

![Capture d’écran 2022-09-03 à 18 48 39](https://user-images.githubusercontent.com/12702322/188280489-5db90d97-6f15-45a8-9f06-bd9da21b2cac.jpg)

Go to your Mainsail Web interface then click on `Machine` tab.

Open `adxl345_fysetc.cfg` file and edit following line with serial you have just obtained:

```
serial: /dev/serial/by-id/usb-Klipper_rp2040_E6605481DB318D34-if00
```

Click on `SAVE & RESTART` at the top right to save the file.

Then uncomment (remove the #) to the following line in the `printer.cfg` file to enable ADXL support:

```
[include adxl345_fysetc.cfg]
```

Click on `SAVE & RESTART` at the top right to save the file.

You should see the `PIS MCU` connecting to Klipper.

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

**Note:** After tests, it's better to disable the ADXL by commenting out the `[include adxl345_fysetc.cfg]` line again.
