# Knowing from which yum repository a package has been installed

install `yum-utils` ,and run

```bash
repoquery -i qbittorrent
```

Sample output:

```

Yum-utils package has been deprecated, use dnf instead.
See 'man yum2dnf' for more information.



Name        : qbittorrent
Version     : 4.1.7
Release     : 1.fc29
Architecture: x86_64
Size        : 9461374
Packager    : Fedora Project
Group       : Unspecified
URL         : http://www.qbittorrent.org
License     : GPLv2+
Repository  : updates
Summary     : A Bittorrent Client
Source      : qbittorrent-4.1.7-1.fc29.src.rpm
Description :
A Bittorrent client using rb_libtorrent and a Qt4 Graphical User Interface.
It aims to be as fast as possible and to provide multi-OS, unicode support.
```

or you can use `yum info`

```bash
yum info ffmpeg
```

Sample output:

```
Last metadata expiration check: 0:19:01 ago on Fri 16 Oct 2020 02:13:48 AM UTC.
Installed Packages
Name         : ffmpeg
Version      : 4.0.5
Release      : 1.fc29
Architecture : x86_64
Size         : 1.7 M
Source       : ffmpeg-4.0.5-1.fc29.src.rpm
Repository   : @System
From repo    : rpmfusion-free-updates
Summary      : Digital VCR and streaming server
URL          : http://ffmpeg.org/
License      : GPLv2+
Description  : FFmpeg is a complete and free Internet live audio and video
             : broadcasting solution for Linux/Unix. It also includes a digital
             : VCR. It can encode in real time in many formats including MPEG1 audio
             : and video, MPEG4, h263, ac3, asf, avi, real, mjpeg, and flash.
```