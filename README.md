# Klipper Configuration for FLSUN V400

![test-flsun-v400 jpg 3683ed2615cedff6a17e282b2dc48190 thumb jpg c579e0706751042e9e214feb12a7c162](https://user-images.githubusercontent.com/12702322/183767560-330689f3-61f6-42d3-9daf-b6c3e6ff845a.jpg)

Klipper is a 3d-Printer firmware. It combines the power of a general purpose computer with one or more micro-controllers.

See the [features document](https://www.klipper3d.org/Features.html) for more information on why you should use Klipper.


## About

This configuration is compatible with FLSUN V400 only.

- Improved settings (drivers current, microsteps, bed leveling and more...)
- Added useful and automated macros with notifications to KlipperScreen
- Added configuration for ADXL345 via USB with Raspberry Pico
- Improved Start/End Gcodes

Updated Klipperscreen version for V400 is also available here : [KlipperScreen-Flsun-V400](https://github.com/Guilouz/KlipperScreen-Flsun-V400)

<br />

If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂

[ ![Download](https://user-images.githubusercontent.com/12702322/115148445-e5a40100-a05f-11eb-8552-c1f5d4355987.png) ](https://www.paypal.me/CyrilGuislain)

<br />

## STL Files

- Motherboard Mount for Easy Access to microSd port : https://www.printables.com/model/268464-flsun-v400-motherboard-mount
- ADXL345 Mount : https://www.printables.com/model/268463-flsun-v400-adxl345-mount
- FLSUN V400 Fanduct : https://www.printables.com/model/268456-flsun-v400-fanduct

<br />

## ADXL345 Wiring

To use ADXL345 with FLSUN V400 it's necessary to use it via USB with a Raspberry Pi Pico.

![ADXL345 Wiring](https://user-images.githubusercontent.com/12702322/188179060-33c3566d-80c7-4f19-8772-da85fd3704c4.png)

<br />

## Enable Root Access

By default Root access is not allowed on Speeder Pad. To activate them, follow these instructions:

- Download this pack and unzip it : [Root Access Enabler.zip](https://github.com/Guilouz/Klipper-Flsun-V400/files/9482488/Root.Access.Enabler.zip)

- Copy `update.sh` file to the root of USB stick provided with V400.

- Printer off, insert the USB stick into one of the ports of the Speeder Pad.

- Turn on the printer and wait for it to start. Once it has restarted, you can remove the USB stick.

- You now have Root access for user `pi`.

- To prevent the script from running on every boot, delete the `update.sh` file and the newly created `update.over` file from the USB stick.

<br />

## SSH Connection

- Download and install the MobaXterm software here: https://mobaxterm.mobatek.net/download-home-edition.html

- Launch it then click on the `Session` icon then `SSH`:

![Capture d’écran 2022-08-31 à 00 27 15](https://user-images.githubusercontent.com/12702322/187554613-7c3b7776-2e9e-41cd-a331-9bcb29324e07.jpg)

![Capture d’écran 2022-08-31 à 00 28 03](https://user-images.githubusercontent.com/12702322/187554724-47adc66d-b76a-4351-8d81-c077c41072c2.jpg)

- Enter the IP address of your Speeder Pad in the `Remote Host` field, check the `Specify username` box and enter the username `pi` in the field then click on `OK`:

![Capture d’écran 2022-09-03 à 14 10 39](https://user-images.githubusercontent.com/12702322/188269957-c6e8fd1c-f9e1-44ed-86bf-6bd5ced24552.jpg)

- On the new displayed window, enter the password `flsun` (it's not displayed when typing, this is normal):

![Capture d’écran 2022-09-03 à 14 16 09](https://user-images.githubusercontent.com/12702322/188270050-8db7c386-dd59-49bb-ba04-ad8014766a2e.jpg)

- An authorization window will appear, authorize it. It is also possible that another window asking you to change the password will appear, ignore it.

- Once connected, on the left part of the window you have access to the folders and files of your Speeder Pad and on the right part to the SSH command prompt window:

![Capture d’écran 2022-09-03 à 14 20 15](https://user-images.githubusercontent.com/12702322/188270163-c9e24cf3-d11a-4870-bc0b-343b1bd32d61.jpg)

<br />

## Password Change

It's possible to change the password of the `pi` user:

- In the SSH command prompt window, enter the following command:
```
passwd
```
- You’ll get asked to enter your current password for verification -> `flsun`.

- After verification, you can type in your new password and press `Enter`.

**Note: You’ll not be able to see any characters on the display while entering the password. So, don’t panic; just type in your password and press `Enter`.**

- Once you’ve successfully verified your password, it’ll get applied right away.

<br />

## Change Timezone

By default, V400 are on Asia timezone. To change that, follow these instructions:

- In the SSH command prompt window, enter the following command to check the current time zone:
```
timedatectl
```
- You can view the available timezones by entering this command:
```
timedatectl list-timezones
```
- You can also find your timezone using this command (replace Paris with your nearest major city):
```
timedatectl list-timezones | grep -i Paris
```
- Then unlink the current timezone with this command (you will need to enter the Root password):
```
sudo unlink /etc/localtime
```
- You can now set the new timezone with this command (replace Europe/Paris by the new timezone):
```
sudo ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
```
- You can then verify that the change has been taken into account by retyping this command:
```
timedatectl
```
