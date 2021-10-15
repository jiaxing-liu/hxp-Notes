# Install Arch Linux from Scratch

## Download iso

Download [Arch Linux iso image](https://archlinux.org/download/) 

burn it via [Rufus](https://rufus.ie/)

Visit [Aliyun mirrors](https://developer.aliyun.com/mirror/) for faster download

## Boot Live Environment

if you encountered error like "nouveau: unknown chipset", hit `e` to edit grub, add

```
nomodeset
```

Connect to wifi

```bash
iwctl
station wlan0 scan
station wlan0 get-networks
station wlan0 connect SSID
```

Update time

```bash
timedatectl set-ntp true
```

Partition disk

```bash
fdisk /dev/sdX
```

Mount filesystems

```bash
mount /dev/partition /mnt
```

## Install Base System

Use mirrorlist

```bash
vim /etc/pacman.d/mirrorlist
```

Install base system

```bash
pacstrap /mnt base linux linux-firmware
```

Generate fstab

```bash
genfstab -U /mnt >> /mnt/etc/fstab
```

Change root

```bash
arch-chroot /mnt
```

Generate ramfs

```bash
mkinitcpio -P
```

Set root password

```bash
passwd
```

install packages that are necessary

```bash
pacman -S iw vim
```

## Install Grub

```bash
mkdir /boot/efi
pacman -S grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/ --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
```

## Install KDE Plasma

```bash
pacman -S plasma
pacman -S kde-applications
systemctl enable sddm
```

