# Fix the powertop always show 0 mW Display Backlight usage error

Today I installed `powertop` to monitor the power consumption of all the devices on my laptop. After installing, I immediately launched it by command `powertop`. And the utility always show me that my display backlight consumes 0 mW of power, like this.

```
Power est.    Usage     Device name
  6.48 W     35.1%        CPU core
  0    W    100.0%        Display backlight
```

I tried to adjust the screen brightness, the "Usage" column did change, but the "Power est." column wouldn't.

After Googling, I installed `acpi` , and tried tuning off the display by

```bash
xset -d :0 dpms force off
```

then tapped touchpad and screen went on, just as **[marcelopm](https://github.com/marcelopm)** said in this [issue](https://github.com/fenrus75/powertop/issues/62) on GitHub.

I also edited `/etc/default/grub`, added

```
GRUB_CMDLINE_LINUX="acpi_backlight=vendor"
```

and regenerated `grub.cfg` by

```bash
sudo grub-mkconfig /boot/grub/grub.cfg
```

The final solution was it and to calibrate powertop with

```bash
sudo powertop --calibrate
```

Then it became normal.

```
The battery reports a discharge rate of 15.2 W
The energy consumed was 409 J
System baseline power is estimated at 24.3 W

Power est.    Usage     Device name
  13.8 W    100.0%        Display backlight
  6.73 W    236.9%        CPU core
  3.71 W    236.9%        CPU misc
 44.0 mW      9.6 pkts/s  Network interface: wlp1s0 (iwlwifi)
    0 mW    100.0%        Radio device: iwlwifi
    0 mW      0.0%        USB device: HP HD Camera (Chicony)
    0 mW      0.0%        USB device: usb-device-8087-0a2b
    0 mW      0.0%        USB device: xHCI Host Controller
    0 mW      0.0%        USB device: usb-device-138a-003f
    0 mW      0.0%        USB device: xHCI Host Controller
    0 mW      0.0%        Audio codec hwC0D0: Conexant
    0 mW      0.0%        Radio device: btusb
            100.0%        PCI Device: Intel Corporation Sunrise Point-LP LPC Controller
```



