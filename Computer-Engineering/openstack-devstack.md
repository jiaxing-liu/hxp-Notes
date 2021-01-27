使用devstack完成OpenStack云计算平台搭建
中间坑实在是太多了，坑了我两天，虽然好像列表没有学RHCA的，但是以后会有的[em]e248[/em]
首先，hostname不能是数字开头的，如果你安装RHEL 8.3或者CentOS 8.3，IP地址是192.168.x.x的话，hostname会给你设置成192，不改的话rabbitmq启动不起来而且systemctl status和/var/log都没有报错日志，我是systemctl cat一下再grep下ExecStart，手动执行服务器启动命令，才出的报错信息[em]e247[/em]
其次是你必须先在局域网内有个机器当HTTP代理，而且需要分流，国内的直连国外的走代理。因为如果你没有这个HTTP代理服务器，GitHub下载和rhsm订阅等到死[em]e247[/em]
你在设置代理的时候必须把127.0.0.1放在no_proxy里，光把本机IP放进去没用，keystone会报500错误[em]e247[/em]
同时必须先设置pip源为国内的，stack.sh用pip下载的时候会无视你配置的https_proxy环境变量，否则pip下载等到死[em]e247[/em]
RHEL8必须启用codeready仓库，否则dnf报错[em]e247[/em] 