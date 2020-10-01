# Vitrualize Ubuntu or Other Systems with KVM and QEMU

## Create Disk Image and Install System

Create Disk Image

```bash
qemu-img create -f qcow2 ubuntu-disk.cow 20G
```

Rezize Image with

```bash
qemu-img resize disk_image +10G
```

Install System

```bash
qemu-system-x86_64 -cdrom ubuntu-20.04.1-desktop-amd64.iso \
  -boot order=d -m 8096 -drive file=ubuntu-disk.cow,format=qcow2 \
  -vnc :0 -smp $(nproc) -usb -device usb-tablet \
  -enable-kvm -vga qxl
```

Run System

```bash
qemu-system-x86_64 -smp $(nproc) -drive file=ubuntu-disk.cow,format=qcow2 -m 8096 --enable-kvm -vnc :0 -usb -device usb-tablet -vga qxl -monitor tcp:127.0.0.1:6666,server,nowait
```

Check if system is running

```bash
echo "info status " | timeout 1 netcat 127.0.0.1 6666 
```

## Copy Files from Host to Guest

Use SMB to share files between guest and host, on host machine, run

```bash
qemu-system-x86_64 -net nic -net user,smb=/dev/shm/ -smp $(nproc) -drive file=ubuntu-disk.cow,format=qcow2 -m 8096 --enable-kvm -vnc :0 -usb -device usb-tablet -vga qxl -monitor tcp:127.0.0.1:6666,server,nowait
```

On guest machine, run

```bash
apt update
apt install cifs-utils
mount -t cifs //10.0.2.4/qemu/ /mnt/
```

## Access SSH in Guest

```bash
qemu-system-x86_64 \
  -smp $(nproc) \
  -drive file=ubuntu-disk.cow,format=qcow2 \
  -m 8096 \
  --enable-kvm -usb -device usb-tablet -vga qxl \
  -device e1000,netdev=net0 \
  -netdev user,id=net0,hostfwd=tcp::5555-:22 \
  -vnc :10
```
