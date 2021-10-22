# Use non-standard SSH port to copy files remotely

```bash
rsync -a root@hxp-us-server:/usr/share/nginx/html . -v -e 'ssh -p 5319'
```

 