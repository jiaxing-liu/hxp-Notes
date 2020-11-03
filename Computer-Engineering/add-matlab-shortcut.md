# Add Matlab Shortcut to GNOME or KDE

create ` vim /usr/share/applications/matlab.desktop `

add these lines

```
[Desktop Entry]
Type=Application
Name=Matlab
GenericName=Matlab 2019b
Comment=Matlab:The Language of Technical Computing
Exec=/usr/local/bin/matlab -desktop
Icon=/usr/local/Polyspace/R2019b/bin/glnxa64/cef_resources/matlab_icon.png
Terminal=false
Categories=Science;Engineering;
```



