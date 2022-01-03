# KVM installation on Gentoo

## Install QEMU and libvirt

Add these USE flags in `/etc/portage/package.use/qemu`:

```
app-emulation/qemu qemu_softmmu_targets_arm qemu_softmmu_targets_x86_64 qemu_softmmu_targets_sparc
app-emulation/qemu qemu_user_targets_x86_64 spice usbredir
app-emulation/qemu QEMU_SOFTMMU_TARGETS: arm x86_64 sparc QEMU_USER_TARGETS: x86_64
```

Add these environment variables in `/etc/portage/make.conf`

```
QEMU_SOFTMMU_TARGETS="arm x86_64 sparc"
QEMU_USER_TARGETS="x86_64"
```

Install:

```bash
sudo emerge app-emulation/qemu app-emulation/libvirt app-emulation/virt-manager app-emulation/virt-viewer
```

After installation, run

```bash
gpasswd -a qemu kvm
gpasswd -a hxp kvm
gpasswd -a hxp libvirt
sudo chmod 666 /dev/kvm
```

Add these lines to `/etc/libvirt/libvirtd.conf`

```bash
auth_unix_ro = "none"
auth_unix_rw = "none"
unix_sock_group = "libvirt"
unix_sock_ro_perms = "0777"
unix_sock_rw_perms = "0770"
```

restart and enable `libvirt`

```bash
sudo rc-service libvirtd restart
sudo rc-update add libvirtd default
```

## Download a Linux LiveCD ISO

```bash
wget https://mirror.sjtu.edu.cn/almalinux/8.4/isos/x86_64/AlmaLinux-8.4-x86_64-dvd.iso
```

Note: AlmaLinux is an alternative of CentOS. The ISO is placed under directory `~/AlmaLinux`.

## Create a qcow2 image

```bash
qemu-img create -o preallocation=full -f qcow2 AlmaLinux-8.4.qcow2 128G
```

Option `preallocation=full` will take more time to create disk image. The advantage is that virtual machine will gain better disk performance. If this option is not applied now, an image in size of several kibibytes will be created immediately, more space will be allocated whenever the virtual machine needs them in the future, resulting in less host machine disk consumption and less virtual machine disk performance.

Note: `AlmaLinux-8.4.qcow2` is also located in `~/AlmaLinux`.

## Install AlmaLinux with LiveCD

```bash
qemu-system-x86_64 -cdrom AlmaLinux-8.4-x86_64-dvd.iso \
  -boot order=d -m 8096 -drive file=AlmaLinux-8.4.qcow2,format=qcow2 \
  -vnc :20 -smp $(nproc) -usb -device usb-tablet \
  -enable-kvm
```

Note: `-vnc :20` means that letting qemu listening on port `5920` for VNC connection, and tunnel the display of virtual machine through it. 

Then use any of the VNC clients, connect to `vnc://<ip_address_of_the_host>:5920`, and finish system installation.

## Add the installed disk to libvirt

To see all available variants:

```bash
osinfo-query os
```

Since `almalinux8` is in the list, we use option `--os-variant almalinux8`.

```bash
sudo virt-install \
  --name AlmaLinux-8.4 \
  --memory 8192 \
  --vcpus 4 \
  --disk AlmaLinux-8.4.qcow2 \
  --import \
  --os-variant almalinux8
```

Note: if you stuck at `Waiting for the installation to complete.`, you need X display to start `virt-viewer`.

## Add VNC to virtual machine

```bash
sudo virt-xml AlmaLinux-8.4 --add-device --graphics vnc,port=5950,listen=0.0.0.0
```

VNC server will start at `vnc://<your_host_ip>:5950` after

```bash
sudo virsh shutdown AlmaLinux-8.4
sudo virsh start AlmaLinux-8.4
```

## Forward ports in virtual machine to host

Shutdown virtual machine

```bash
sudo virsh shutdown AlmaLinux-8.4
```

Wait until virtual machine shuts down. Use

```bash
sudo virsh list --all
```

to see virtual machine status.

Then edit xml

```bash
sudo EDITOR=vim virsh edit AlmaLinux-8.4
```

Change the first line from

```xml
<domain type='kvm'>
```

to

```xml
<domain type='kvm' xmlns:qemu='http://libvirt.org/schemas/domain/qemu/1.0'>
```

and add these lines after `</devices>`, before `</domain>` as the last child of `<domain>` element

```xml
<qemu:commandline>
   <qemu:arg value='-netdev'/>
   <qemu:arg value='user,id=mynet.0,net=10.0.10.0/24,hostfwd=tcp::22222-:22,hostfwd=tcp::8000-:8000'/>
   <qemu:arg value='-device'/>
   <qemu:arg value='e1000,netdev=mynet.0'/>
 </qemu:commandline>
```

Remove

```xml
<interface type='network'>
  <mac address='52:54:00:02:1d:78'/>
  <source network='default'/>
  <model type='virtio'/>
  <address type='pci' domain='0x0000' bus='0x01' slot='0x00' function='0x0'/>
</interface>
```

then restart virtual machine

```bash
sudo virsh shutdown AlmaLinux-8.4
sudo virsh start AlmaLinux-8.4
```

## Auto start virtual machine on system boot

```bash
sudo virsh autostart AlmaLinux/AlmaLinux-8.4
```

