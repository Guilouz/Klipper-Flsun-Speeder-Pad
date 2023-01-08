## Connecting

- Download and install [MobaXterm](https://mobaxterm.mobatek.net/download-home-edition.html). 

- Launch it then click on the `Session` icon:

![Capture d’écran 2022-12-12 à 02 03 41](https://user-images.githubusercontent.com/12702322/206940814-f1702b7b-d65a-491b-824d-d3b43a066151.jpg)

- Then on then `SSH` icon:

![Capture d’écran 2022-12-12 à 02 08 09](https://user-images.githubusercontent.com/12702322/206940944-c0817b21-7cce-471c-90bd-f8dfc1ce22f2.jpg)

- Enter the IP address of your Speeder Pad in the `Remote Host` field, check the `Specify username` box and enter the username `pi` in the field then click on `OK`:

![Capture d’écran 2022-12-12 à 02 10 23](https://user-images.githubusercontent.com/12702322/206941163-a3c8d2cc-1a1b-467b-8c57-9a3ca0095b29.jpg)

- On the new displayed window, enter the password `flsun` (it's not displayed when typing, this is normal):

![Capture d’écran 2022-12-12 à 02 12 15](https://user-images.githubusercontent.com/12702322/206941248-47377e1f-fbba-4ed6-b2b4-c1a030d9d056.jpg)

- An authorization window will appear, authorize it. It's also possible that another window asking you to change the password will appear, ignore it.

- Once connected, on the left part of the window you have access to the folders and files of your Speeder Pad and on the right part to the SSH command prompt window:

![Capture d’écran 2022-12-12 à 02 13 17](https://user-images.githubusercontent.com/12702322/206941372-21da318e-0175-4219-bc4d-7fbf3f360dcb.jpg)


## Change Password

It's possible to change the password of the `pi` user:

- In the SSH command prompt window, enter the following command:
```
passwd
```

- You’ll get asked to enter your current password for verification -> `flsun`.

- After verification, you can type in your new password and press `Enter`.
  - **Note: You’ll not be able to see any characters on the window while entering the password. So, don’t panic, just type in your password and press `Enter`.**

- Once you’ve successfully verified your password, it’ll get applied right away.


You can now [Update Ubuntu](update-ubuntu.md).