Install Cinnamon

```
yum group list
yum groupinstall "Cinnamon Desktop"
```

Install TigerVNC server

```
yum install tigervnc tigervnc-server
```

Add firewall-cmd rule

```
firewall-cmd --add-service=vnc-server --permanent
firewall-cmd --reload
```

Add xstartup

```
mkdir ~/.vnc/
nano ~/.vnc/xstartup
```

put this into `xstartup`

```
#!/bin/sh
#
exec /usr/bin/cinnamon-session
```

Start vnc

```
vncserver :1 -geometry 1024x600 -depth 24
```

Kill vnc

```
vncserver -kill :1
```

Create systemd config.

```
cp /lib/systemd/system/vncserver@.service  /etc/systemd/system/vncserver@:1.service
```

And change "<USER>" to your username, then reload systemctl

```
systemctl daemon-reload
```

Change VNC password

```
vncpasswd
```

Edit `/etc/sysconfig/vncservers`, and fire the server with systemctl.
