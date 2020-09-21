# Cisco路由器的配置

## 局域网接口配置

```
(config) # interface g0/1
(config-if) # ip address <ip_addr> <mask>
(config-if) # bandwidth 1000000
(config-if) # duplex full
```

## 异步串行接口配置

```
(config) # interface a1
(config-if) # ip unnumbered ethernet0
(config-if) # encapsulation ppp
(config-if) # async default ip address <ip_addr>
(config-if) # async dynamic-routing
(config-if) # async mode interactive
```

## 同步串行接口配置

```
(config) # interface s1/1
(config-if) # bandwidth 2048
(config-if) # ip address <ip_addr> <mask>
(config-if) # encapsulation <hdlc|ppp>
```

## POS接口配置

```
(config) # interface POS3/0
(config-if) # bandwidth 2500000
(config-if) # ip address <ip_addr> <mask>
(config-if) # crc 32
(config-if) # pos framing <sdh|sonet>
(config-if) # no ip directed-broadcast
(config-if) # pos flag s1s0 <2|0>
```

## Loopback接口配置

```
(config) # interface loopback 0
(config-if) # ip address <ip_addr> 255.255.255.255
(config-if) # no ip route-cache
(config-if) # no ip mroute-cache
```

## 静态路由配置

```
(config) # ip route <ip_dest> <mask> <ip_next>
```

## RIP动态路由协议配置

```
(config) # router rip
(config-router) # network <ip_network>
(config-router) # passive-interface ethernet 0
```

## OSPF动态路由协议配置

```
(config) # router ospf <pid>
(config-router) # network <ip> <wildcard_mask> area <area_id>
(config-router) # area <area_id> range <subnet_ip> <mask>
```

## 访问控制

### 创建ACL

`access-list`指令

```
(config) # access-list <acl_id> <permit|deny> <source_ip> <wildcard_mask>
(config) # access-list <acl_id> <permit|deny> <protocol> <source_ip> 
           <source_wildcard_mask> <dest_ip> <dest_wildcard_mask>
           eq <port_number>
```

`ip access-list`指令

```
(config) # ip access-list <extended|standard> <acl_number>
(config-ext-nacl) # deny udp any any eq 1434
(config-ext-nael) # permit ip any any
```

### 启用ACL

```
(config-if) # ip access-group <acl_id> <in|out>
```
