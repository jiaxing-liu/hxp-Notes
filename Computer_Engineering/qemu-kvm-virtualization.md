# Vitrualize Ubuntu or other systems with KVM and QEMU
 
Create Disk Image

```
qemu-img create -f qcow2 ubuntu-disk.cow 20G
```

Rezize Image with

```
qemu-img resize disk_image +10G
```
 
Install System
 
```
qemu-system-x86_64 -cdrom ubuntu-20.04.1-desktop-amd64.iso -boot order=d -m 8096 -drive file=ubuntu-disk.cow,format=qcow2 -vnc :0 -smp $(nproc) -usb -device usb-tablet -enable-kvm -vga qxl
```

Run System

```
qemu-system-x86_64 -smp $(nproc) -drive file=ubuntu-disk.cow,format=qcow2 -m 8096 --enable-kvm -vnc :0 -usb -device usb-tablet -vga qxl -monitor tcp:127.0.0.1:6666,server,nowait
```

Check if system is running

```
echo "info status " | timeout 1 netcat 127.0.0.1 6666 
```
