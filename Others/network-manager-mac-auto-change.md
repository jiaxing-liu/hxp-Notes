# Configure NetworkManager to Change MAC Address everytime iface restarts

Edit `/etc/NetworkManager/conf.d/00-macrandomize.conf`, add

```
[device]
wifi.scan-rand-mac-address=yes

[connection]
wifi.cloned-mac-address=stable
ethernet.cloned-mac-address=stable
connection.stable-id=${CONNECTION}/${BOOT}
```