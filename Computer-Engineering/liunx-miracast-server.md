# Use Linux as a Miracast receiver

# Download and compile miraclecast

Download zip from <https://github.com/albfan/miraclecast>

Do what README says.

### Install dependencies

```bash
sudo dnf install cmake meson glib2-devel systemd-devel readline-devel check libtool iw
```

### Test compatibilities

```bash
cd res
sudo ./test-hardware-capabilities.sh
```

### Make and install

```bash
mkdir build
cd build/
../autogen.sh g --prefix=/usr
make -j12
sudo make install
```

## Fire up the server

```bash
systemctl stop NetworkManager
sudo systemctl stop NetworkManager
sudo systemctl stop wpa_supplicant
sudo miracle-wifid &
```

## Connect

```bash
sudo miracle-sinkctl
run 3
```

```bash
$ sudo miracle-wifictl --log-level trace
[miraclectl] # list
  LINK INTERFACE                FRIENDLY-NAME                 
     3 wlp3s0                   archlinux-alberto             

  LINK PEER-ID                  FRIENDLY-NAME                  CONNECTED 

 0 peers and 1 links listed.
[miraclectl] # select 3
link 3 selected
[ADD] Peer: f2:27:65:35:b6:8f@3
[PROV] Peer: ff:ff:ff:ff:ff:ff@3 Type: pbc PIN: 
[miraclectl] # list
  LINK INTERFACE                FRIENDLY-NAME                 
     3 wlp3s0                   archlinux-alberto             

  LINK PEER-ID                  FRIENDLY-NAME                  CONNECTED 
     3 ff:ff:ff:ff:ff:ff@3           Alberto Fanjul Alonso            no        

 1 peers and 1 links listed.
[miraclectl] # connect ff:ff:ff:ff:ff:ff@3
[CONNECT] Peer: ff:ff:ff:ff:ff:ff@3
[miraclectl] # list
  LINK INTERFACE                FRIENDLY-NAME                 
     3 wlp3s0                   archlinux-alberto             

  LINK PEER-ID                  FRIENDLY-NAME                  CONNECTED 
     3 ff:ff:ff:ff:ff:ff@3           Alberto Fanjul Alonso            yes        

 1 peers and 1 links listed.
```

## Troubleshooting

If you cannot connect to miraclecast, run

```bash
sudo miracle-wifid --log-level trace
```

to show debug information. And if the error is described as

```
ERROR: supplicant: HUP on dhcp-comm socket on p2p-wlo1-1 (supplicant_group_comm_fn() in ../../../src/wifi/wifid-supplicant.c:247)
```

try 

```bash
sudo miracle-dhcp --netdev <your_interface>
```

In my case, the command failed with error:

```
ERROR: dhcp: execution of ip-binary (/bin/ip) not allowed: No such file or directory (parse_argv() in ../../../src/dhcp/dhcp.c:877)
```

I ran

```bash
which ip
```

it prints

```
/usr/sbin/ip
```

So the solution was

```bash
sudo ln -s /usr/sbin/ip /bin/ip
```

