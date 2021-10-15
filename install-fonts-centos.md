# Install Hack font on CentOS

Download zip

```
wget https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip
```

unzip

```
unzip Hack-v3.003-ttf.zip 
```

install

```
mv ttf hack
cp -r hack /usr/share/fonts/
fc-cache -f -v
```

Check

```
fc-list | grep "Hack"
```

# Install Windows Font

```
git clone https://github.com/hxp-plus/Windows-Font-Collection.git
cd Windows-Font-Collection
cp -r winfonts /usr/share/fonts/
fc-cache -f -v
```







 
