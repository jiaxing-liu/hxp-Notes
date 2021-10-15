# Install OpenStack All-in-one CentOS Stream

Disable SELinux, install network-scripts, enable network, mask, disable, stop NetworkManager and firewalld, and run

```bash
sudo dnf install -y https://www.rdoproject.org/repos/rdo-release.el8.rpm
sudo dnf config-manager --enable powertools
sudo dnf install -y openstack-packstack
```

Then use packstack to deploy openstack

```bash
sudo packstack --gen-answer-file=/root/answers.txt
sudo vim /root/answers.txt
sudo packstatk --answer-file=/root/answers.txt
```



