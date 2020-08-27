# Install Openvpn on Fedora

## Server

First, get the script from <https://github.com/angristan/openvpn-install> and make it executable:

```
curl -O https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
chmod +x openvpn-install.sh
```

Then run it:

```
./openvpn-install.sh
```

After that you have a vpn, but you still need to do the routing so that clients can connect to internet

```
sh /etc/iptables/add-openvpn-rules.sh
sysctl -w net.ipv4.ip_forward=1
```

Check the routing by

```
iptables -t nat -L -n -v
sysctl net.ipv4.ip_forward
```

### Add log feature to vpn

Edit `/etc/openvpn/server.conf `, add

```
log-append /var/log/openvpn.log
```

And restart

```
systemctl restart openvpn-server@server.service
```

## Add or Remove User

Just simply run the installation script again

```
./openvpn-install.sh
```

## Assign an Static IP for a Client

```
echo "ifconfig-push 10.8.0.50 255.255.255.0" > /etc/openvpn/ccd/<vpn-username>
```

## Client

Download the ovpn file

```
scp root@vpn-server:/root/<vpn-username>.ovpn .
```

Install Openvpn

```
yum install openvpn
```

Connect

```
sudo cp desktop.ovpn /etc/openvpn/client/
sudo openvpn --client --config /etc/openvpn/client/<vpn-username>.ovpn
```

Check your connection by

```
dig TXT +short o-o.myaddr.l.google.com @ns1.google.com
```

Should return your vpn server's ip address

For kde users, you need to install `networkmanager-openvpn`, and add vpn through terminal:

```
nmcli connection import type openvpn file <vpn-username>.ovpn
```

Every time I add the vpn via kde gui, it fails. Maybe there are some bugs in importing openvpn configs.


