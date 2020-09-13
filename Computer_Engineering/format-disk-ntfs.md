# Format USB Pen Drive to NTFS or FAT32 in Linux

## List all Drives

```bash
lsblk
```

Output:

```
NAME   MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
sda      8:0    0 238.5G  0 disk 
├─sda1   8:1    0   512M  0 part 
├─sda2   8:2    0   230G  0 part /
└─sda3   8:3    0     8G  0 part [SWAP]
sdc      8:32   1  14.4G  0 disk 
└─sdc1   8:33   1  14.4G  0 part 
```

`/dev/sdc`is my pen drive

## Format Drive to FAT32

```bash
sudo mkfs.vfat -F 32 -n FAT32_Drive /dev/sdc1
```

## Format Drive to NTFS

```bash
sudo mkfs.ntfs -L NTFS_Drive /dev/sdc1 --fast
```

## Check the Result

```bash
lsblk -f
```

Output:

```
NAME FSTYPE FSVER LABEL UUID                                 FSAVAIL FSUSE% MOUNTPOINT
sda                                                                         
├─sda1
│    vfat   FAT32       0C90-0A32                                           
├─sda2
│    ext4   1.0         003b15f2-4d5d-4b64-97b3-1405c9b50d87   12.2G    89% /
└─sda3
     swap   1           3b745370-dce7-483a-abd4-27439f9cdea4                [SWAP]
sdb                                                                         
└─sdb1
     ntfs         NTFS_Drive
                        5DBD6807501FCEB3 
```
