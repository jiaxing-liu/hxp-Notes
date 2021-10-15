# Crack Multi-file large rar password

## Step 0: Prerequisites

### Compile John the ripper

Download source code from <https://github.com/openwall/john>, unzip and compile:

```bash
# Assume that the zip file is located in the current working directory
unzip john-bleeding-jumbo.zip
cd john-bleeding-jumbo
cd src
./configure
make -j${nproc}
```

all the binary executable, including `rar2john`, will be created under `../run`

## Compile Hashcat

Download source zip from <https://github.com/hashcat/hashcat>, unzip and complie:

```bash
# Assume that the zip file is located in the current directory
unzip hashcat-master.zip
make -j${nproc}
```

the executable `hashcat` will be created in current directory

## Install rar

The rar command is needed to create an rar archive for testing. But rar has been removed from yum repos

Download rar package from <http://rpmfind.net/linux/rpm2html/search.php?query=rar>

```bash
wget http://rpmfind.net/linux/atrpms/f20-x86_64/atrpms/stable/rar-4.2.0-4.fc20.i686.rpm
```

And install via yum locally

```bash
sudo yum localinstall rar-4.2.0-4.fc20.i686.rpm
```

## Install unrar

The unrar command can be installed via yum repositories

```bash
sudo yum install unrar
```

## Prepare an encrypted rar archive

```bash
echo "This is an Encrypted file" > encrypted.txt
# Create an rar archive whose password is "pwd1"
rar a -p"pwd1" encrypted.rar encrypted.txt
rm encrypted.txt
# Verify the password we created
unrar e encrypted.rar
```

## Step 1: Extract hash from rar

Extract hash from rar file:

```bash
/path/to/rar2john encrypted.rar | tail -n1 | cut -d : -f2 > encrypted.rar.hash
```

Do some small edit to the hash: make the hash looks like the example hashes in <https://hashcat.net/wiki/doku.php?id=example_hashes>

## Step 2: Brute-force hash

Query the hash code for rar

```bash
/path/to/hashcat --help | grep -i rar
```

the output result was:

```
  12500 | RAR3-hp                                          | Archives
  23800 | RAR3-p (Compressed)                              | Archives
  23700 | RAR3-p (Uncompressed)                            | Archives
  13000 | RAR5                                             | Archives
```

which indicated that there are 2 types of rar encrypting method: rar3 and rar5

took a look at the hash extracted

```bash
cat encrypted.rar.hash
```

output:

```
encrypted.rar:$RAR3$*1*50d054eef44984dc*4a6fff1f*48*26*1*db17e71ed5e0d46832ce34939fa9ae4862b897d72a09f089abfc850e75f8d894d9d42c5e4bb2df24b90d036c4cd96df8*33:1::encrypted.txt 
```

indicated that the hash is rar3 encrypted. So I ran

```bash
## Assume password contains 3 to 5 lowercase letters or numbers.
/path/to/hashcat -a 3 -m 23800 --force encrypted.rar.hash -1 '?d?l' '?1?1?1?1?1' -i --increment-min 3
```

After a while, hashcat finished cracking and quited.

Run

```bash
/path/to/hashcat -a 3 -m 23800 --show encrypted.rar.hash
```

to view the cracked password. 

To delete cracked results, run:

```bash
rm /path/to/hashcat/hashcat.potfile
```



