# Configure Bluetooth Audio for Arch Linux 

After installation of Arch Linux with KDE, I can connect my bluetooth keyboard with the GUI in KDE. But whenever I tried to connect my bluetooth headset, connect never succeeds.

Here's my solution, install these packages:

```bash
sudo pacman -S pulseaudio-alsa pulseaudio-bluetooth bluez-utils
```

And then try to connect via CLI commands:

```bash
bluetoothctl
power on
agent on
default-agent
scan on
```

After a few seconds, I switched by headset to pairing mode, and it appeared at my console

```
[CHG] Device 4C:87:5D:07:6F:11 Name: Bose QC35 II
[CHG] Device 4C:87:5D:07:6F:11 Alias: Bose QC35 II
```

Pair it with command:

```
pair 4C:87:5D:07:6F:11
```

It failed:

```
Attempting to pair with 4C:87:5D:07:6F:11
[CHG] Device 4C:87:5D:07:6F:11 Connected: yes
Failed to pair: org.bluez.Error.AuthenticationFailed
[CHG] Device 4C:87:5D:07:6F:11 Connected: no
```

but obscurely connect works for me

```
[bluetooth]# connect 4C:87:5D:07:6F:11
Attempting to connect to 4C:87:5D:07:6F:11
[CHG] Device 4C:87:5D:07:6F:11 Connected: yes
[CHG] Device 4C:87:5D:07:6F:11 UUIDs: 00000000-deca-fade-deca-deafdecacaff
[CHG] Device 4C:87:5D:07:6F:11 UUIDs: 00001101-0000-1000-8000-00805f9b34fb
[CHG] Device 4C:87:5D:07:6F:11 UUIDs: 00001108-0000-1000-8000-00805f9b34fb
[CHG] Device 4C:87:5D:07:6F:11 UUIDs: 0000110b-0000-1000-8000-00805f9b34fb
[CHG] Device 4C:87:5D:07:6F:11 UUIDs: 0000110c-0000-1000-8000-00805f9b34fb
[CHG] Device 4C:87:5D:07:6F:11 UUIDs: 0000110e-0000-1000-8000-00805f9b34fb
[CHG] Device 4C:87:5D:07:6F:11 UUIDs: 0000111e-0000-1000-8000-00805f9b34fb
[CHG] Device 4C:87:5D:07:6F:11 UUIDs: 0000112f-0000-1000-8000-00805f9b34fb
[CHG] Device 4C:87:5D:07:6F:11 UUIDs: 00001200-0000-1000-8000-00805f9b34fb
[CHG] Device 4C:87:5D:07:6F:11 UUIDs: 81c2e72a-0591-443e-a1ff-05f988593351
[CHG] Device 4C:87:5D:07:6F:11 UUIDs: 931c7e8a-540f-4686-b798-e8df0a2ad9f7
[CHG] Device 4C:87:5D:07:6F:11 UUIDs: f8d1fbe4-7966-4334-8024-ff96c9330e15
Connection successful
[CHG] Device 4C:87:5D:07:6F:11 ServicesResolved: yes
```

And it still works across reboot.