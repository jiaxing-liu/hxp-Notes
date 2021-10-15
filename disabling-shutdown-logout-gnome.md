# Disabling Shutdown and Logout in GNOME

Use this extension to remove the shutdown button： <https://github.com/mmartinortiz/RmPwOffBtn/tree/keeping-shutdown-object>

And also disabling shutdown in systemctl

```
systemctl mask poweroff.target
```

To prevent the user logging out in gnome:

```
gsettings set org.gnome.desktop.lockdown disable-lock-screen true
gsettings set org.gnome.desktop.lockdown disable-log-out true
gsettings set org.gnome.desktop.lockdown disable-user-switching true
``` 
