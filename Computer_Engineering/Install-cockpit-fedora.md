```
yum install -y firewalld storaged cockpit cockpit-storaged
systemctl enable --now cockpit
firewall-cmd --add-service=cockpit
```

