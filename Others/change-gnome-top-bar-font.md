# Change GNOME Top Bar font

Install GNOME Shell Extension

```
yum install gnome-shell
```

Create a theme folder

```
mkdir -p MyTheme/gnome-shell
```

Write the theme css file `MyTheme/gnome-shell/gnome-shell.css`

```
@import url("/usr/share/themes/Adapta/gnome-shell/gnome-shell.css");

stage {
    font-family: Microsoft YaHei UI, Sans-Serif;
    font-size: 10pt;
    color: #000000;
}
```

Install the theme

```
mkdir -p ~/.theme/
mv MyTheme ~/.themes/
```

And then activate it in `gnome-tweak-tools`
