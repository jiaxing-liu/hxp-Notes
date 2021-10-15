 # Bug fix for Matlab R2020a black ui

If you install Matlab R2020a on Arch Linux, you may discover that if you open live script or help window, the windows will be black with nothing shown, and no error message will be shown to you.

Here is the solution:

```bash
yay -S libsepol libselinux
sudo mkdir /usr/local/Polyspace/R2020a/cefclient/sys/os/glnxa64/0_excluded
sudo mv /usr/local/Polyspace/R2020a//cefclient/sys/os/glnxa64/libg* /usr/local/Polyspace/R2020a/cefclient/sys/os/glnxa64/0_excluded
```

