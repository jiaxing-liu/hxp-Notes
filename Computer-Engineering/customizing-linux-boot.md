# Customizing Linux Boot

To show kernel messages:

```
GRUB_CMDLINE_LINUX_DEFAULT="splash"
```

To enable hibernate:

```
GRUB_CMDLINE_LINUX="resume=UUID=3b745370-dce7-483a-abd4-27439f9cdea4"
```

disk uuid can be shown by `blkid` command.

generate `grub.cfg` :

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

and then edit `/etc/mkinitcpio.conf`, find the line that looks like this: 

```
HOOKS="base udev autodetect modconf block filesystems keyboard fsck"
```

It is located in the section named `HOOKS`. After `udev` insert hook `resume` (Like this: `..base udev resume..`) 

```
HOOKS="base udev resume autodetect modconf block filesystems keyboard fsck"
```

Save the file. run

```
`mkinitcpio -p linux`
```

to generate initramfs.



To boot into runlevel 3:

```bash
sudo systemctl set-default multi-user.target
```

To get current default runlevel:

```bash
sudo systemctl get-default
```