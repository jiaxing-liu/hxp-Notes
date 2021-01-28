# Deploying OpenStack Cluster on CentOS Stream with packstack

 ## Environment Description

5 CentOS Stream with external network access is needed. The following table describes the hardware requirements.

| Role       | hostname   | IP address   | CPU    | RAM  | Disk  |
| ---------- | ---------- | ------------ | ------ | ---- | ----- |
| Controller | controller | 192.168.0.10 | 2vCPUs | 8GB  | 100GB |
| Compute    | compute01  | 192.168.0.20 | 4vCPUs | 16GB | 200GB |
| Compute    | compute02  | 192.168.0.21 | 4vCPUs | 16GB | 200GB |
| Network    | network    | 192.168.0.30 | 2vCPUs | 8GB  | 100GB |
| NTP        | ntp        | 192.168.0.40 | 1vCPU  | 2GB  | 20GB  |

Network configuration is described below

- Gateway IP Address: 192.168.0.1
- Subnet Address: 192.168.0.0/24
- Available IP Address: 192.168.0.50 - 150
- DNS Server: 192.168.0.1

## Set Static IP Address

On all hosts

```bash
[root@192 ~]# nmcli connection modify ens33 ipv4.method manual ipv4.addresses <ip_addr>/24 ipv4.dns 192.168.0.1 ipv4.gateway 192.168.0.1 autoconnect yes
[root@192 ~]# nmcli connection up ens33 
```

## Configure Hostname

Write `/etc/hosts`

```
# Static table lookup for hostnames.
# See hosts(5) for details.
#
127.0.0.1    localhost

192.168.0.10 controller
192.168.0.20 compute01
192.168.0.21 compute02
192.168.0.30 network
192.168.0.40 ntp
```

Distribute `/etc/hosts` to all hosts

```bash
for server in {controller,compute01,compute02,network,ntp};do scp /etc/hosts root@$server:/etc/hosts;done
```

Set hostname

```bash
for server in {controller,compute01,compute02,network,ntp};do ssh root@$server "hostnamectl set-hostname $server";done
```

## Disable Firewall, SELinux, NetworkManager

On all hosts

```bash
for server in {controller,compute01,compute02,network,ntp};do ssh root@$server "systemctl disable --now firewalld";done
for server in {controller,compute01,compute02,network,ntp};do ssh root@$server "systemctl mask firewalld";done
for server in {controller,compute01,compute02,network,ntp};do ssh root@$server "sed -i 's/SELINUX=enforcing/SELinux=disabled/' /etc/sysconfig/selinux";done
for server in {controller,compute01,compute02,network,ntp};do ssh root@$server "sed -i 's/SELINUX=enforcing/SELinux=disabled/' /etc/selinux/config";done
for server in {controller,compute01,compute02,network,ntp};do ssh root@$server "setenforce 0";done
for server in {controller,compute01,compute02,network,ntp};do ssh root@$server "dnf install -y network-scripts";done
for server in {controller,compute01,compute02,network,ntp};do ssh root@$server "systemctl disable --now NetworkManager";done
for server in {controller,compute01,compute02,network,ntp};do ssh root@$server "systemctl enable --now network";done
for server in {controller,compute01,compute02,network,ntp};do ssh root@$server "systemctl reboot";done
```

## Enable NTP

On ntp, edit `/etc/chrony.conf`

```bash
# Allow NTP client access from local network.
allow 192.168.0.0/24
```

On other servers, edit `/etc/chrony.conf`

```
# Use public servers from the pool.ntp.org project.
# Please consider joining the pool (http://www.pool.ntp.org/join.html).
# pool 2.centos.pool.ntp.org iburst
pool ntp iburst
```

On all hosts

```bash
systemctl enable --now chronyd.service
systemctl restart chronyd.service
```

Verify

```bash
for server in {controller,compute01,compute02,network,ntp};do ssh root@$server "chronyc sources";done
```

## Install OpenStack Repository

On all OpenStack attenders

```bash
for server in {controller,compute01,compute02,network};do ssh root@$server "dnf config-manager --enable powertools";done
for server in {controller,compute01,compute02,network};do ssh root@$server "dnf install -y epel-release";done
for server in {controller,compute01,compute02,network};do ssh root@$server "dnf -y update";done
for server in {controller,compute01,compute02,network};do ssh root@$server "sudo dnf install -y https://www.rdoproject.org/repos/rdo-release.el8.rpm";done
for server in {controller,compute01,compute02,network};do ssh root@$server "sudo dnf install -y centos-release-openstack-victoria";done
for server in {controller,compute01,compute02,network};do ssh root@$server "dnf -y update";done
```

## Install Packstack

On controller

```bash
dnf install -y openstack-packstack
```

## Generate answer file

On controller

```bash
packstack \
--os-neutron-ml2-tenant-network-types=vxlan \
--os-neutron-l2-agent=openvswitch \
--os-neutron-ml2-type-drivers=vxlan,flat \
--os-neutron-ml2-mechanism-drivers=openvswitch \
--keystone-admin-passwd=redhat \
--nova-libvirt-virt-type=kvm \
--provision-demo=n \
--cinder-volumes-create=y \
--os-heat-install=y \
--os-swift-storage-size=20G \
--gen-answer-file /root/answers.txt
```

in this case, admin password is set to `redhat`, Edit `/root/answers.txt`

```
# Specify 'y' if you want to run OpenStack services in debug mode;
# otherwise, specify 'n'. ['y', 'n']
CONFIG_DEBUG_MODE=y

# Server on which to install OpenStack services specific to the
# controller role (for example, API servers or dashboard).
CONFIG_CONTROLLER_HOST=192.168.0.10

# List the servers on which to install the Compute service.
CONFIG_COMPUTE_HOSTS=192.168.0.20,192.168.0.21

# List of servers on which to install the network service such as
# Compute networking (nova network) or OpenStack Networking (neutron).
CONFIG_NETWORK_HOSTS=192.168.0.30
```

## Deploy with answer file

On controller

```bash
packstack --answer-file /root/answers.txt --timeout=3000
```

