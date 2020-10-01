# Crack Multi-file Large Zip Password

### Step 0: Delete all large file in the archive

For multi-file zip archives, the password for each file are usually the same. So we just need to crack one of the file's password.

Since the hash of large file is long, and hashcat only supports a data length of about 8 KB when cracking zip passwords, it is impossible for us to crack large file password. So we delete all large  file in an archive, just keep the smallest file.

I used Ark to perform this action.

### Step 1: Create hash file

```
zip2john file.zip | cut -d ":" -f 2 > zip.hash
```

### Step 2: Install and Configure Hashcat

My laptop do not have Nvidia or AMD GPU, only Intel processer is installed. So I need to install opencl driver by

```
sudo pacman -S intel-compute-runtime
```

Try hashcat benchmark

```
hashcat --benchmark --force
```

### Step 3: Determine the hash type

Observe the hash

```
cat zip.hash
```

Output:

```
file.zip/破解必读.txt:$zip2$*0*3*0*465b166248bf0908518ab125ade7765c*638b*eb
*24dd7716b7da6a0a2b4c63ec3b59edb1627655735efac226966a4750f54065948e8a45ce
c33a55543dad2c81d70a66307ace0870e4ddb97ef28dc147f0954d83136b2e2c3cd2b920c
2b7e1f6a35c3fc7e65e1d3994508e4fcfe8e4d8d477dac181f727d111001654234450530a
8e84d588226c2e5e6a696afd617b56952f3f3e06c4fb6f64e8f365b95fbacf2aa1f4e6a1e
71a5d146ba1b0aa24c7b17890c4f8ebf6e6c48422288dbe7b4279bd1b9065c92c34fa2278
2ad7aa9bc8d666fc7f5ec801c60d979bc3a106ec5ecff82058ac46e139bd6d3e0086d581a
a32d5f98bdaa426f1c58122eaf6c3269b*c658ddbebd8d31abba1c*$/zip2$:破解必读.txt:file.zip:file.zip
```



at the end of the hash, which indicates that the signature is `zip2`, to determine which hash code to use, use `grep`

```
hashcat --help | grep zip --ignore-case
```

Output

```
  11600 | 7-Zip                                            | Archives
  17200 | PKZIP (Compressed)                               | Archives
  17220 | PKZIP (Compressed Multi-File)                    | Archives
  17225 | PKZIP (Mixed Multi-File)                         | Archives
  17230 | PKZIP (Mixed Multi-File Checksum-Only)           | Archives
  17210 | PKZIP (Uncompressed)                             | Archives
  20500 | PKZIP Master Key                                 | Archives
  20510 | PKZIP Master Key (6 byte optimization)           | Archives
  23001 | SecureZIP AES-128                                | Archives
  23002 | SecureZIP AES-192                                | Archives
  23003 | SecureZIP AES-256                                | Archives
  13600 | WinZip                                           | Archives
```

The hash code for `zip` is `13600`.

Then we start cracking. Since I have known that the password contains 4 digits consists of lower-case letters and numbers.

```
hashcat -a 3 -m 13600 --force file.hash -1 '?d?l' '?1?1?1?1'
```
