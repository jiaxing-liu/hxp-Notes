# Cast Android to Fedora using scrcpy

Install copr repo

```bash
cd /etc/yum.repos.d/
sudo wget https://copr.fedorainfracloud.org/coprs/zeno/scrcpy/repo/fedora-33/zeno-scrcpy-fedora-33.repo
```

Install [scrcpy](https://github.com/Genymobile/scrcpy)

```bash
sudo yum install scrcpy
```

Connect your devices via adb

First connect via USB and run

```bash
adb tcpip 5555
```

Then detach and connect via wifi

```bash
adb connect 192.168.0.100
```

See also <https://developer.android.com/studio/command-line/adb#Enabling>

