# Download m3u8 with FFmepg

```bash
ffmpeg -protocol_whitelist file,http,https,tcp,tls,crypto -i "http://s6.vidshare.tv/hls/pdommq4tlsm4f4kmledsh5d5fcn27i35msjxqw62lfflut5bgaqhb5kirb5q/index-v1-a1.m3u8" -c copy video.mp4
```
