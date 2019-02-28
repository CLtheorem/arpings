# arpings
利用arping命令批量发现局域网内存活主机
```
Usage: ./arpings interface
Avaliable interface:
	br-133d1db9f98a br-1e4cf58baa3e docker0 eth0 lo  # 脚本会检测并显示本机可用的网卡接口
For example, scanning at eth0 interface: ./arpings eth0
```
执行脚本后，会显示扫描到的存活主机ip。
