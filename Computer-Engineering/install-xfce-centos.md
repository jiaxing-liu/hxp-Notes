# Install Xfce Desktop with VNC on CentOS

## dnf install packages

make sure you have installed epel-release and run

```bash
sudo dnf groupinstall "xfce"
sudo dnf install tigervnc-server
```

## Configure VNC server

```bash
vncserver
```

## Edit VNC startup script

edit `~/.vnc/xstartup`, comment

```bash
exec /etc/X11/xinit/xinitrc
```

add

```bash
exec startxfce4
```

kill and restart vncserver

```bash
vncserver -kill :1
vncserver
```

## Add firewall rules

```bash
sudo firewall-cmd --add-service=vnc-server --permanent
sudo firewall-cmd --reload
```

connect `yourip:5901`via vncviewer and test

### Add systemctl startup script

```bash
sudo cp /usr/lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service
sudo nano /etc/systemd/system/vncserver@\:1.service
```

and change "hxp" to your username

```bash
[Unit]
Description=Remote desktop service (VNC)
After=syslog.target network.target

[Service]
Type=simple
User=root
Group=root

# Clean any existing files in /tmp/.X11-unix environment
ExecStartPre=/bin/sh -c '/usr/bin/vncserver -kill %i > /dev/null 2>&1 || :'
ExecStart=/usr/bin/vncserver_wrapper hxp %i
ExecStop=/bin/sh -c '/usr/bin/vncserver -kill %i > /dev/null 2>&1 || :'

[Install]
WantedBy=multi-user.target
```

reload systemctl and start service

```bash
sudo systemctl daemon-reload
sudo systemctl enable --now vncserver@:1.service
```