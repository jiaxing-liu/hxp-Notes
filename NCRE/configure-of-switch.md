# Cisco交换机的配置

## 显示交换表

小型交换机

```
# show mac-address-table
```

大型交换机

```
# show cam dynamic
```

## 更改时间

Cisco IOS

```
# clock set hh:mm:ss day month year
```

Cisco CatOS

```
(enable) set time day_of_week mm/dd/yy hh:mm:ss
```

## 配置管理IP

Cisco IOS

```
(config) # interface VLAN1
(config-if) # ip address <ip_addr> <mask>
```

Cisco CatOS

```
(enable) set interface sc0 <ip_addr> <mask> <broadcast_addr>
```

## 配置缺省路由

Cisco IOS

```
(config) # ip default-gateway <ip_addr>
```

Cisco CatOS

```
(enable) set ip route 0.0.0.0 <ip_addr>
```

## 配置端口通信方式

Cisco IOS

```
(config-if) duplex <auto|half|full>
```

Cisco CatOS

```
(enable) set port duplex <port> <auto|half|full>
```

## 配置VTP

Cisco IOS

```
(config) # vtp domain <domain_name>
(config) # vtp mode <server|client|transparent>
```

Cisco CatOS

```
(enable) set vtp domain <domain_name>
(enable) set vtp mode <server|client|transparent>
```

## 建立VLAN

Cisco IOS

```
# vlan data
(vlan) # vlan <vlan_id> name <vlan_name>
```

Cisco CatOS

```
(enable) set vlan <vlan_id> name <vlan_name>
```

## 将端口加入VLAN

Cisco IOS

```
(config-if) # switchport access vlan <vlan_id>
```

Cisco CatOS

```
(enable) set vlan <vlan_id> <port>
```

## 配置VLAN Trunk

Cisco IOS

```
(config-if) # switchport mode trunk
(config-if) # switchport trunk encapsulation <dot1q|isl>
(config-if) # switchport trunk allowed vlan <vlan_id>
```

Cisco CatOS

```
(enable) set trunk <port> on <dot1q|isl>
(enable) set trunk <port> vlan <vlan_id>
```

## STP可选功能

Cisco IOS

```
(config) # spanning-tree backbonefast
(config) # spanning-tree uplinkfast max-update-rate <0-32000>
(config) # spanning-tree portfast default
(config) # spanning-tree portfast bpdufilter default
```

Cisco CatOS

```
(enable) set spantree backbonefast enable
(enable) set spantree uplinkfast enable rate <0-32000>
(enable) set spantree portfast <port> <enable|disable|default>
(enable) set spantree portfast bdpufilter <port> <enable|disable|default>
```
