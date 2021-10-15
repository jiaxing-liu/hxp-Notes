# Disable Linux Shutdown

*WARNING:* This approach will disable systemctl commands as a side effect.

Edit `/etc/sudoers`

```bash
visudo
```

Add

```
Cmnd_Alias      REBOOT = /sbin/halt, /sbin/reboot, /sbin/poweroff, /usr/bin/shu
tdown, /bin/shutdown
root ALL=(ALL) ALL, !REBOOT
%wheel ALL=(ALL) ALL, !REBOOT
```

Strip permissions for root

```
su
chmod -x /bin/halt
chmod -x /bin/reboot
chmod -x /bin/poweroff
```
