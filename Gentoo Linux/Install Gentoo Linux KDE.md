# Install Gentoo Linux KDE based on CLI

## Install sudo

```bash
emerge sudo
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
usermod -aG wheel hxp
```

## Add USE flag

```bash
echo "USE=\"bindist mmx sse sse2 mmxext dbus udev branding icu python X acpi display-manager sddm gtk handbook libkms wallpapers pulseaudio legacy-systray gtk2 gtk3 -gtk -gnome\"" >> /etc/portage/make.conf
echo "INPUT_DEVICES=\"evdev keyboard mouse synaptics\"" >> /etc/portage/make.conf
```

## Choose Profile

```
eselect profile list
eselect profile set 8
```

## Install dbus

```bash
emerge --changed-use --deep @world
emerge -v sys-apps/dbus
/etc/init.d/dbus start
rc-update add dbus default
rc-update add udev sysinit
```

## Install Xorg Drivers

```
emerge -v x11-base/xorg-drivers
emerge -v x11-base/xorg-x11
```

## Allow users to video access

```bash
gpasswd -a root video
gpasswd -a hxp video
```

## Start installing KDE Plasma

```bash
echo "USE=\"harfbuzz bindist mmx sse sse2 mmxext dbus udev branding icu python X acpi display-manager sddm gtk handbook libkms wallpapers pulseaudio legacy-systray gtk2 gtk3 -gtk -gnome\"" >> /etc/portage/make.conf
emerge --changed-use --deep @world
# Install Plasma desktop only
emerge -v kde-plasma/plasma-desktop
dispatch-conf
chmod +s /sbin/unix_chkpwd
emerge -v kde-plasma/kdeplasma-addons kde-apps/kwalletmanager kde-apps/dolphin x11-misc/sddm kde-plasma/systemsettings kde-plasma/kscreen kde-apps/konsole
```

## Change display manager

```bash
emerge -v gui-libs/display-manager-init
rc-update add display-manager default
sed -i 's/DISPLAYMANAGER="xdm"/DISPLAYMANAGER="sddm"/' /etc/conf.d/display-manager
usermod -a -G video sddm
```

## Reboot and test KDE Installation

```bash
reboot
```

# Install all plasma apps and addons

## Install basic KDE apps first

```bash
emerge -v kde-plasma/plasma-meta
emerge -v kde-plasma/kdeplasma-addons kde-apps/kwalletmanager kde-apps/dolphin x11-misc/sddm kde-plasma/systemsettings kde-plasma/kscreen kde-apps/konsole
emerge -v net-misc/networkmanager kde-plasma/plasma-nm
rc-update del dhcpcd default
rc-service NetworkManager start
rc-update add NetworkManager default
```

## Then install all KDE apps

```bash
echo 'USE="postproc harfbuzz mmx sse sse2 mmxext dbus udev branding icu python X acpi display-manager sddm gtk handbook libkms wallpapers pulseaudio legacy-systray gtk2 -gtk -gnome"
ABI_X86="(64)"' >> /etc/portage/make.conf
emerge -avuND --keep-going  @world --exclude="openssl http-parser"
emerge -avuND --keep-going  @world --exclude="nodejs"
emerge firefox kde-apps/kde-apps-meta
```

