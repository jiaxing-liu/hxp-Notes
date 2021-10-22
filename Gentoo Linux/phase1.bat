printf "g\nn\n1\n\n+256M\nt\nuefi\nn\n2\n\n+4G\nt\n2\nswap\nn\n3\n\n\nt\n3\nlinux\np\nw\n" | fdisk /dev/sda
sync
mkfs.vfat -F 32 /dev/sda1
mkswap /dev/sda2
mkfs.ext4 -F /dev/sda3
swapon /dev/sda2
mkdir -p /mnt/gentoo
mount /dev/sda3 /mnt/gentoo/
ntpd -q -g
cd /mnt/gentoo
wget https://mirrors.tuna.tsinghua.edu.cn/gentoo/releases/amd64/autobuilds/20211010T170540Z/stage3-amd64-openrc-20211010T170540Z.tar.xz
tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner
sed -i 's/COMMON_FLAGS="-O2 -pipe"/COMMON_FLAGS="-march=x86-64 -O2 -pipe"/' /mnt/gentoo/etc/portage/make.conf
echo MAKEOPTS="\"-j$(nproc)\"" >> /mnt/gentoo/etc/portage/make.conf
echo 'GENTOO_MIRRORS="https://mirrors.tuna.tsinghua.edu.cn/gentoo"' >> /mnt/gentoo/etc/portage/make.conf
mkdir --parents /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
sed -i 's/sync-uri = rsync:\/\/rsync.gentoo.org\/gentoo-portage/sync-uri = rsync:\/\/mirrors.tuna.tsinghua.edu.cn\/gentoo-portage/' /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
mount --bind /run /mnt/gentoo/run
mount --make-slave /mnt/gentoo/run
echo "Plaase run: chroot /mnt/gentoo /bin/bash"
