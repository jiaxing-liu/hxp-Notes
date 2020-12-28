# Patching Windows 10 registry to fix Chinese font display error

If you installed an English version of Windows 10, then you will definitely discover that all the Chinese characters in system are displayed in different size. The solution is to use Registry Editor, go to

```
Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontLink\SystemLink
```

Edit key `Segoe UI`, move

```
MSYH.TTC,Microsoft YaHei UI,128,96
MSYH.TTC,Microsoft YaHer UI
```

To the beginning of the key, then logout and log in back.

Then go to Control Panel -> Region -> Administrative -> Change system locale

And change locale to "Chinese (Simplified, China)"
