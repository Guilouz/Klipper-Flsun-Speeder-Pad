# Update Ubuntu Dependencies

In the SSH command prompt window, enter the following command to download updates list (you will need to enter the Root password):

```
sudo apt update
```

Then this command to install all of them:

```
sudo apt full-upgrade
```

Then remove not needed dependencies (one command at a time):

```
sudo apt remove --purge tailscale
sudo apt autoremove
sudo rm /etc/apt/sources.list.d/tailscale.list
sudo rm /usr/share/keyrings/tailscale-archive-keyring.gpg
sudo rm -rf /var/cache/tailscale
sudo apt autoclean
sudo apt clean
```

And this command to reboot:

```
sudo reboot
```

You should now [Change Timezone](change-timezone.md).