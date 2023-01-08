# Get USB Serial from Motherboard

Connect your printer to one of the Pad's USB ports.

Connect in SSH then enter the following command to retrieve the motherboard USB serial:

```
ls /dev/serial/by-id/*
```

You should see the USB serial appear like this (serial is different depending on the motherboard):

![Capture d’écran 2022-10-22 à 23 08 29](https://user-images.githubusercontent.com/12702322/197362963-65c93e37-1cd2-49d3-83d3-45a98450a44f.jpg)

Go to your Mainsail Web interface then click on `Machine` tab.

Open `printer.cfg` file and find `[mcu]` section.

Edit the following existing line with serial you have just obtained like this:

```
serial: /dev/serial/by-id/usb-1a86_USB_Serial-if00-port0
```

Click on `SAVE & RESTART` at the top right to save the file.

Your printer should connect to your PAD.

You now need to make changes to KlipperScreen, continue at [Update KlipperScreen](update-klipperscreen.md).