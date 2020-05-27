# 403 Forbidden When Accessing Files in Webroot through Softlink #

Created a soft link in `/usr/share/nginx/html/`z via

```
ln -s /root/qqbot/data.txt .
```

Expecting to access `data.txt` from `http://<ip address>/data.txt`

Ruturned 403 Forbidden.

Solution was to change the mod of `/root/qqbot/` to `755`

```
chmod -R 755 /root/qqbotl
```
