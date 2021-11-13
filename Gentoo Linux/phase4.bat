emerge media-fonts/font-isas-misc media-fonts/arphicfonts media-fonts/opendesktop-fonts media-fonts/wqy-zenhei media-fonts/zh-kcfonts
emerge fcitx-qt5
emerge app-i18n/fcitx-configtool
emerge app-i18n/fcitx-rime
echo "export GTK_IM_MODULE=fcitx" >> ~/.xprofile
echo "export QT_IM_MODULE=fcitx" >> ~/.xprofile
echo "export XMODIFIERS=@im=fcitx" >> ~/.xprofile
