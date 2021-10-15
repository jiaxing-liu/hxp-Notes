# Set Time Automatically on Linux

```bash
yum install ntp
ntpdate pool.ntp.org
# OR 
sudo chronyd -q 'server pool.ntp.org iburst'
```