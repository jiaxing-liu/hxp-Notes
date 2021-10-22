# Use libvirt to Run KVM

### Install a qcow image

```bash
virt-install \
  --name ibpe \
  --memory 2048 \
  --vcpus 2 \
  --disk /run/media/hxp/hxp-ssd/qemu-vm/ubuntu-disk.cow \
  --import \
  --os-variant ubuntu20.04
```

### Delete KVM

Stop VM

```bash
virsh shutdown ibpe
```

And then find and delete `suorce file`,

```bash
virsh dumpxml ibpe | grep 'source file'
```

Delete the disk file, and destroy vm

```bash
virsh destroy ibpe
```

Undefine VM

```bash
virsh undefine ibpe
```

### Add VNC to your VM

Stop VM and edit xml

```bash
virt-xml ibpe --add-device --graphics vnc,port=-1,autoport=yes,listen=0.0.0.0
```

And start VM.

### Forward Host Port 22222 to Guest Port 22

Edit xml

```bash
EDITOR=nano virsh edit ibpe
```

Change the first line to

```
<domain type='kvm' xmlns:qemu='http://libvirt.org/schemas/domain/qemu/1.0'>
```

Remove user interface like this

```
<interface type='user'>
  <mac address='52:54:00:52:35:ff'/>
  <model type='rtl8139'/>
  <address type='pci' domain='0x0000' bus='0x00' slot='0x03' function='0x0'/>
</interface>
```

And add this as the last child of `<domain>`

```
<qemu:commandline>
  <qemu:arg value='-netdev'/>
  <qemu:arg value='user,id=mynet.0,net=10.0.10.0/24,hostfwd=tcp::22222-:22'/>
  <qemu:arg value='-device'/>
  <qemu:arg value='rtl8139,netdev=mynet.0'/>
</qemu:commandline>
```

### Start KVM on Host Boot

```bash
virsh autostart ibpe
```

### Change Number of Accessible vCPU and RAM for a KVM

```bash
virsh destroy ibpe
virsh setvcpus --count 4 ibpe --config
virsh setmaxmem ibpe 6G --config
virsh setmem ibpe 6G --config
virsh start ibpe
```

### Export and Load VM Config

To export

```bash
virsh dumpxml vmname > vmname.xml 
```

To load

```bash
virsh define /tmp/myvm.xml
```