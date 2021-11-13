# Disable host key checking in SSH clients

```bash
vim ~/.ssh/config
```

```
Host *
    StrictHostKeyChecking no
    UserKnownHostsFile=/dev/null
    LogLevel ERROR
    PubkeyAcceptedKeyTypes +ssh-rsa
```



