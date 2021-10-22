source /etc/profile
mount /dev/sda1 /boot
emerge-webrsync
emerge --sync
eselect profile list
eselect profile set 1
emerge --verbose --update --deep --newuse @world
echo "ACCEPT_LICENSE=\"*\"" >> /etc/portage/make.conf
echo "Asia/Shanghai" > /etc/timezone
emerge --config sys-libs/timezone-data
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
echo "zh_CN.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
eselect locale list
eselect locale set 5
env-update && source /etc/profile
emerge sys-kernel/gentoo-sources
eselect kernel list
eselect kernel set 1
ls -l /usr/src/linux
emerge sys-kernel/genkernel
echo "/dev/sda1	/boot	vfat	defaults	0 2" >> /etc/fstab
genkernel all
ls /boot/vmlinu* /boot/initramfs*
echo "/dev/sda2	swap	swap	defaults	0 0" >> /etc/fstab
echo "/dev/sda3	/	ext4	defaults	0 0" >> /etc/fstab
echo "hostname=\"hxp-server\"" > /etc/conf.d/hostname
echo "dns_domain_lo=\"homenetwork\"" > /etc/conf.d/net
echo "nis_domain_lo=\"my-nisdomain\"" > /etc/conf.d/net
emerge --noreplace net-misc/netifrc
echo "config_ens33=\"dhcp\"" > /etc/conf.d/net
cd /etc/init.d
ln -s net.lo net.ens33
rc-update add net.ens33 default
sed -i 's/^password/# password/' /etc/pam.d/system-auth
echo "password	required	pam_unix.so nullok sha512 shadow" >> /etc/pam.d/system-auth
sed -i 's/root:x:/root::/' /etc/passwd
emerge app-admin/sysklogd
rc-update add sysklogd default
emerge sys-process/cronie
rc-update add cronie default
emerge sys-apps/mlocate
rc-update add sshd default
emerge sys-fs/e2fsprogs sys-fs/xfsprogs sys-fs/dosfstools
emerge net-misc/dhcpcd
echo 'GRUB_PLATFORMS="efi-64"' >> /etc/portage/make.conf
emerge sys-boot/grub:2
grub-install --target=x86_64-efi --efi-directory=/boot
grub-mkconfig -o /boot/grub/grub.cfg
mkdir /boot/EFI/boot
cp /boot/EFI/gentoo/grubx64.efi /boot/EFI/boot/bootx64.efi
useradd -m -G users,wheel,audio -s /bin/bash hxp
sed -i 's/hxp:x:/hxp::/' /etc/passwd
