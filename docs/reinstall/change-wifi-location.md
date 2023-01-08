# Change Wi-Fi Location

By default, there is no Wi-Fi location defined.

In the SSH command prompt window, enter the following command to check the current Wi-Fi location:

```
iw reg get
```

You obtain this:

```
global
country 00: DFS-UNSET
        (755 - 928 @ 2), (N/A, 20), (N/A), NO-IR
        (2402 - 2472 @ 40), (N/A, 20), (N/A)
        (2457 - 2482 @ 20), (N/A, 20), (N/A), AUTO-BW, NO-IR
        (2474 - 2494 @ 20), (N/A, 20), (N/A), NO-OFDM, NO-IR
        (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW, NO-IR
        (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW, NO-IR
        (5490 - 5730 @ 160), (N/A, 20), (0 ms), DFS, NO-IR
        (5735 - 5835 @ 80), (N/A, 20), (N/A), NO-IR
        (57240 - 63720 @ 2160), (N/A, 0), (N/A)
```

All available locations can be displayed with this command:

```
sudo cat /usr/share/zoneinfo/zone.tab
```

To change the location enter the following command replacing `FR` by your country (you will need to enter the Root password):

```
sudo iw reg set FR
```

You can verify that the change has been made by entering this command again:

```
iw reg get
```

You obtain this (related to your country):

```
global
country FR: DFS-ETSI
        (2400 - 2483 @ 40), (N/A, 20), (N/A)
        (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
        (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
        (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
        (5725 - 5875 @ 80), (N/A, 13), (N/A)
        (5945 - 6425 @ 160), (N/A, 23), (N/A), NO-OUTDOOR
        (57000 - 71000 @ 2160), (N/A, 40), (N/A)
```

To make the location permanent, enter the following command replacing `FR` by your country (you will need to enter the Root password):

```
sudo sed -i 's/^REG.*=$/&FR/' /etc/default/crda
```

Then, this command:

```
sudo sed -i '/^exit 0/ d' /etc/rc.local
```

And this command replacing `FR` by your country:

```
echo -e "iw reg set FR\nexit 0" | sudo tee -a /etc/rc.local
```

Then reboot with this command:

```
sudo reboot
```

At this point the re-install is over, however it now needs [Configuration](../configuration/delete-old.md).