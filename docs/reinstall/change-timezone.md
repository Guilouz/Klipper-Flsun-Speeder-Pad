# Change Timezone

To change Timezone, follow these instructions:

- In the SSH command prompt window, enter the following command to check the current time zone:
```
timedatectl
```
- You can change your timezone by entering this command:
```
sudo dpkg-reconfigure tzdata
```
- On the page that appears, select your geographic area from the list and press `Enter`.

- Then select your timezone in the new list and press `Enter`.

- You can then verify that the change has been taken into account by retyping this command:
```
timedatectl
```

You should now continue at [Change WiFi Location](change-wifi-location.md).