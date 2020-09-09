Install TigerVNC server

```
yum install tigervnc tigervnc-server
```

Create systemd config.

```
cp /lib/systemd/system/vncserver@.service  /etc/systemd/system/vncserver@:1.service
```

And change "<USER>" to your username.

Change VNC password

```
vncpasswd
```

Edit `/etc/sysconfig/vncservers`, and fire the server with systemctl.
