# Bridging WLAN Networks Using 2 Wireless Cards

## Method 1: brctl (Not working)

wlan0: turn on 4addr

```bash
sudo iw dev wlan0 set 4addr on
```

wlan1: turn on monitor mode

```bash
sudo airmon-ng start wlan1
```

fire up the ap

```bash
sudo airbase-ng --essid HUST_WIRELESS_TWIN -c 6 wlan1mon
```

add bridge

```bash
sudo brctl addbr mitm-bridge
sudo brctl addif mitm-bridge at0
sudo brctl addif mitm-bridge wlan0
```

## Method 2: hostapd

edit `hostapd.conf`

```
interface=wlan1
ssid=Wifi_Lab
channel=6
```

edit `dnsmasq.conf`

```
interface=wlan1
dhcp-range=10.0.0.10,10.0.0.250,255.255.255.0,12h
dhcp-option=3,10.0.0.1
dhcp-option=6,10.0.0.1
log-queries
log-dhcp
```

edit fakehosts.conf

```
10.0.0.1 baidu.com
```

fire up dns and dhcp server

```bash
sudo dnsmasq -C dnsmasq.conf -H fakehosts.conf -d
```

fire up the access point

```bash
sudo hostapd hostapd.conf
```

assign IP to ap

```bash
sudo ifconfig wlan1 10.0.0.1 
```

enable NAT

```bash
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain
iptables -P FORWARD ACCEPT
iptables --table nat --append POSTROUTING --out-interface wlan0 -j MASQUERADE
iptables --append FORWARD --in-interface wlan0 -j ACCEPT
echo 1 > /proc/sys/net/ipv4/ip_forward
```

Tips: you may replace wlan0 to tun0 to share VPN tunnel through WiFi.