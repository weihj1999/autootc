## Creating a bridge docker1 and shared network shared_nw
```BASH
# Delete the IP address from eth1
$ sudo ip addr del 192.168.56.10/24 dev eth1
# Create "shared_nw" with a bridge name "docker1"
$ sudo docker network create \
    --driver bridge \
    --subnet=192.168.33.0/24 \
    --gateway=192.168.33.10 \
    --opt "com.docker.network.bridge.name"="docker1" \
    shared_nw
# Add docker1 to eth1
$ sudo brctl addif docker1 eth1
```
Verify docker network
```BASH
$docker net ls
$ip a
```
## docker1 can be list

## Run Containers
```BASH
$ docker run --name container1 --net shared_nw --ip 192.168.56.11 -dt ubuntu
$ docker run --name container2 --net shared_nw --ip 192.168.56.12 -dt ubuntu
$ docker run --name container3 --net shared_nw --ip 192.168.56.13 -dt ubuntu
```
