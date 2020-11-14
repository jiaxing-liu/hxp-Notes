# Moving existing Arch Linux installation to VMWare

## Step 1: Copy files

mount an external drive, formatted in ext4 (this is important, cause other file system format such as ntfs cannot preserve file permissions). `cd` into the drive and use `rsync` to copy all files on the existing system to external drive, preserving file permission, ACL, and all attributes.

```bash
sudo rsync -aAXH --progress  --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} / .
```

then umount the drive.

## Step 2: Copy all the files to the VM

Start VM, boot with archlinux live iso, use `fstab` to create partition table for `/dev/sda` in the VM, making file system with `mkfs.ext4`, then mount `/dev/sda1` to `/mnt` or somewhere. 

Then plug in the external drive and mount `/dev/sdb1` to `/old` or somewhere. Use `rsync` to copy all files back.

```bash
rsync -aAXH --progress /old/* /mnt/
```

## Step 3: Regenerate fstab

```bash
echo '# End of old fstab' >> /mnt/etc/fstab
genfstab -U /mnt >> /mnt/etc/fstab
```

Then check `/mnt/etc/fstab` with text editor.

## Step 4: Install GRUB

```bash
arch-chroot /mnt
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
mkinitcpio -p linux
```

## Step 5: Exit and poweroff

```bash
exit
poweroff
```

