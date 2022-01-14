# Install and Configure SMB service on Manjaro KDE

## Install required packages

```bash
yay -Sy samba
yay -Sy wsdd
```

Note: `wsdd `is required for local network discovery. Although samba server can run without `wsdd`, windows would not discover the network drives shared when the server's `wsdd` is down.

## Configure samba

```bash
sudo touch /etc/samba/smb.conf
sudo vim /etc/samba/smb.conf
```

A sample `/etc/samba/smb.conf` sharing user's home directory and `/data` directory (writable only if user is in staff group).

```
[global]
   workgroup = WORKGROUP
   server string = Manjaro
   server role = standalone server
   log file = /usr/local/samba/var/log.%m
   max log size = 50

[homes]
   comment = Home Directories
   browseable = no
   writable = yes

[data]
   comment = Data Directories
   path = /data
   public = yes
   writable = no
   printable = no
   write list = @staff
```

## Create /data directory and set SMB password

```bash
sudo smbpasswd -a <your_username>
sudo mkdir -p /data
sudo groupadd staff # Create staff group
sudo usermod -aG staff <your_username> # Add user to staff group
sudo chown root:staff /data # Change group ownership to staff group
sudo chmod 770 /data # Change group permission to allow read and write
```

## Start services

```bash
sudo systemctl start smb
sudo systemctl start wsdd
sudo systemctl enable smb
sudo systemctl enable wsdd
```

## References

[Samba - ArchWiki](https://wiki.archlinux.org/title/samba)

[A sample samba config](https://git.samba.org/samba.git/?p=samba.git;a=blob_plain;f=examples/smb.conf.default;hb=HEAD)
