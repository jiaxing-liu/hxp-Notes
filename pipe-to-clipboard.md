# Piping Terminal to Clipboard

 install `xclip`

```bash
sudo pacman -S xclip
```

set alias: add alias to `.bashrc`

```bash
alias setclip="xclip -selection c"
alias getclip="xclip -selection c -o"
```

start piping

```bash
grep 'xclip' .bashrc | setclip
```

