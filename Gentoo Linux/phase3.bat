emerge sudo
echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
usermod -aG wheel hxp
echo "USE=\"bindist mmx sse sse2 mmxext dbus udev branding icu python X acpi display-manager sddm gtk handbook libkms wallpapers pulseaudio legacy-systray gtk2 gtk3 -gtk -gnome\"" >> /etc/portage/make.conf
echo "INPUT_DEVICES=\"evdev keyboard mouse synaptics\"" >> /etc/portage/make.conf
eselect profile list
eselect profile set 8
emerge --changed-use --deep @world
emerge -v sys-apps/dbus
/etc/init.d/dbus start
rc-update add dbus default
rc-update add udev sysinit
emerge -v x11-base/xorg-drivers
emerge -v x11-base/xorg-x11
gpasswd -a root video
gpasswd -a hxp video
echo "USE=\"harfbuzz bindist mmx sse sse2 mmxext dbus udev branding icu python X acpi display-manager sddm gtk handbook libkms wallpapers pulseaudio legacy-systray gtk2 gtk3 -gtk -gnome\"" >> /etc/portage/make.conf
emerge --changed-use --deep @world
emerge -v kde-plasma/plasma-desktop
chmod +s /sbin/unix_chkpwd
emerge -v kde-plasma/kdeplasma-addons kde-apps/kwalletmanager kde-apps/dolphin x11-misc/sddm kde-plasma/systemsettings kde-plasma/kscreen kde-apps/konsole
emerge -v gui-libs/display-manager-init
rc-update add display-manager default
sed -i 's/DISPLAYMANAGER="xdm"/DISPLAYMANAGER="sddm"/' /etc/conf.d/display-manager
usermod -a -G video sddm
emerge -v kde-plasma/plasma-meta
emerge -v kde-plasma/kdeplasma-addons kde-apps/kwalletmanager kde-apps/dolphin x11-misc/sddm kde-plasma/systemsettings kde-plasma/kscreen kde-apps/konsole
emerge -v net-misc/networkmanager kde-plasma/plasma-nm
rc-update del dhcpcd default
rc-service NetworkManager start
rc-update add NetworkManager default
echo 'USE="postproc harfbuzz mmx sse sse2 mmxext dbus udev branding icu python X acpi display-manager sddm gtk handbook libkms wallpapers pulseaudio legacy-systray gtk2 -gtk -gnome"' >> /etc/portage/make.conf
echo 'ABI_X86="(64)"' >> /etc/portage/make.conf
emerge -vuND --keep-going  @world --exclude="nodejs"
emerge -vuND --keep-going  @world --exclude="openssl http-parser"
emerge firefox kde-apps/kde-apps-meta
