# Disable host key checking in SSH clients

```bash
~/.ssh/config
```

```
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile=/dev/null
    LogLevel ERROR
```



