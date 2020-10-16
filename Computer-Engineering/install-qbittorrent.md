# Install qbittorrent with nginx reverse proxy on Fedora Cloud

## Install and start qbittorrent

Install via `yum`

```bash
yum install qbittorrent
yum install qbittorrent-nox
```

Run `qbittorrent-nox`

```bash
qbittorrent-nox
```

Add user `qbtuser`

```bash
useradd qbtuser
```

Add `qbittorrent-nox` to `systemctl`

```bash
nano /usr/lib/systemd/system/qbittorrent.service
```

```
[Unit]
Description=qbittorrent torrent server

[Service]
User=qbtuser   
ExecStart=/usr/bin/qbittorrent-nox --webui-port=8080
Restart=on-abort

[Install]
WantedBy=multi-user.target
```

Reload `systemctl`

```bash
systemctl daemon-reload
```

Enable `qbittorrent` in `systemctl`

```bash
systemctl enable qbittorrent --now
```

## Add nginx reverse proxy

Edit `/etc/nginx/default.d/qbittorrent.conf`, add

```
location /qbt/ {
    proxy_pass              http://localhost:8080/;
    proxy_set_header        X-Forwarded-Host        $server_name:$server_port;
    proxy_hide_header       Referer;
    proxy_hide_header       Origin;
    proxy_set_header        Referer                 '';
    proxy_set_header        Origin                  '';
    add_header              X-Frame-Options         "SAMEORIGIN";
}
```

And remember to check

```
include default.d/*.conf;
```

exist in your `nginx.conf`

Test Nginx config

```bash
nginx -t
```

and restart nginx

```bash
systemctl restart nginx
```

the default username and password for qbittorrt is`admin` and `adminadmin`