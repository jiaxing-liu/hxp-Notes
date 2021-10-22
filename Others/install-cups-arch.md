# Install CUPS Printing Service

install `cups` package

```bash
sudo pacman -S cups-pdf
```

enable service

```bash
sudo systemctl enable cups-browsed.service --now
```

visit <http://localhost:631/> in browser, click "Administration" and enter your linux username and password. For example, I entered username "hxp" and my password.

Then add virtual pirnters, printed file will be put under `/var/spool/`