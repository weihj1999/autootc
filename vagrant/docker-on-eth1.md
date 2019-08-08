## Creating a bridge docker1 and shared network shared_nw
```BASH
# Delete the IP address from eth1
$ sudo ip addr del 192.168.56.10/24 dev eth1
# Create "shared_nw" with a bridge name "docker1"
$ sudo docker network create \
    --driver bridge \
    --subnet=192.168.56.0/24 \
    --gateway=192.168.56.10 \
    --opt "com.docker.network.bridge.name"="docker1" \
    shared_nw
# Add docker1 to eth1
$ sudo brctl addif docker1 eth1
```
Verify docker network
```BASH
$docker network ls
$ip a
```
## docker1 can be list

## Run Containers
```BASH
$ docker run --name container1 --net shared_nw --ip 192.168.56.11 -dt ubuntu
$ docker run --name container2 --net shared_nw --ip 192.168.56.12 -dt ubuntu
$ docker run --name container3 --net shared_nw --ip 192.168.56.13 -dt ubuntu
```

## Making the network setting permanent
At this point, the network bridge will be detatched from eth1 if you reboot the machine. So here are two more things to make the setting permanent.
Update ```/etc/network/interfaces``` like this:
```BASH
auto eth1
iface eth1 inet manual
   pre-up ifconfig $IFACE up
   post-down ifconfig $IFACE down
```
And add the following command on ```/etc/rc.local```(before exit 0):
```BASH
brctl addif docker1 eth1
```
使用network-scripts配置网桥网卡
ifcfg-docker1
```
DEVICE=docker1
TYPE=Bridge
BOOTPROTO=static
DNS1=8.8.8.8
IPADDR=192.168.56.10
NETMASK=255.255.255.0
ONBOOT=yes
```
ifcfg-eth1
```
DEVICE=eth1
ONBOOT=yes
TYPE=Ethernet
IPV6INIT=no
USERCTL=no
BRIDGE=docker1
```

docker run --name mysql57 --net shared_nw --ip 192.168.56.11 -e MYSQL_ROOT_PASSWORD=passw0rd -d mysql:5.7

docker run --name myjira --net share_nw --ip 192.168.56.12 --detach --publish 8080:8080 cptactionhank/atlassian-jira:latest

$ docker exec -it mysql57 bash
登录mysql的容器，执行mysql客户端去创建DB，授权等操作
进入容器后：
mysql -P 3306 --protocol=tcp -u root -p

GRANT SELECT,INSERT,UPDATE,DELETE,CREATE,DROP,ALTER,INDEX on jiradb.* TO 'root'@'192.168.56.12' IDENTIFIED BY 'passw0rd';

配置JiRA需要邮箱，
需要账号激活license，同时关联了服务器号和ip地址
