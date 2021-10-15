# Install deb package on Arch Linux

## Install debtap

```bash
yay -S debtap
```

## Convert to pkg

```bash
sudo debtap -u
sudo debtap PacketTracer_731_amd64.deb
```

## Install via pacman

```bash
sudo pacman -U packettracer-7.3.1-1-x86_64.pkg.tar.zst
```
