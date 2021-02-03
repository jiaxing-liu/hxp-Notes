# OpenStack Tenant Network

 ## Environment Description

### External Network

5 CentOS 8.3 with external network access is needed. The following table describes the hardware requirements.

| Role       | hostname   | IP address   | CPU    | RAM  | Disk  |
| ---------- | ---------- | ------------ | ------ | ---- | ----- |
| Controller | controller | 192.168.8.10 | 2vCPUs | 8GB  | 100GB |
| Compute    | compute01  | 192.168.8.20 | 4vCPUs | 16GB | 200GB |
| Compute    | compute02  | 192.168.8.21 | 4vCPUs | 16GB | 200GB |
| Network    | network    | 192.168.8.30 | 2vCPUs | 8GB  | 100GB |
| NTP        | ntp        | 192.168.8.40 | 1vCPU  | 2GB  | 20GB  |

Network configuration is described below

- Gateway IP Address: 192.168.8.1
- Subnet Address: 192.168.8.0/24
- Available IP Address: 192.168.8.50 - 150
- DNS Server: 192.168.8.1

### Internal Network

The following table describes the hardware requirements.

| Role       | hostname   | IP address     |
| ---------- | ---------- | -------------- |
| Controller | controller | 192.168.128.10 |
| Compute    | compute01  | 192.168.128.20 |
| Compute    | compute02  | 192.168.128.21 |
| Network    | network    | 192.168.128.30 |

Network configuration is described below

- Subnet Address: 192.168.128.0/24