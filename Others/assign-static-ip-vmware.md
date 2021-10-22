Edit `C:\ProgramData\VMware\vmnetdhcp.conf`

Add

```
host VMnet8 {
    hardware ethernet 00:0C:29:C6:C7:5E;
    fixed-address 192.168.9.23;
}
```

Run

```
net stop vmnetdhcp
net start vmnetdhcp
```

As admin
