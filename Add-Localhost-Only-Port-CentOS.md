# Add a localhost-only port in CentOS via firewall-cmd

## Zone Manipulating

To see which zones are available on your system:

```
firewall-cmd --get-zones
```

To see detailed information for all zones:

```
firewall-cmd --list-all-zones
```

To see detailed information for a specific zone:

```
firewall-cmd --zone=zone-name --list-all
```

Assign the interface to a different zone:

```
firewall-cmd --zone=zone-name --change-interface=<interface-name>
```

## Allow a port only on localhost

Assign loopback interface `lo` to `trusted` zone

```
firewall-cmd --permanent --zone=trusted --add-interface=lo
```

Add a port to `trusted` zone

```
firewall-cmd --permanent --zone=trusted --add-port=<port>/tcp
firewall-cmd --permanent --zone=trusted --add-port=<port>/udp
```

Reload

```
firewall-cmd --reload
```
