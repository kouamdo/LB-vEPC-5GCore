# LB-vEPC-5GCore
Load balancing implementation for vEPC and 5G Core

Repo show Load balancing with DSR IPIP .

HSS and PCRF are not available.

Please , firstly , try to read this repo https://bitbucket.org/infinitydon/opensource-5g-core-service-mesh/src/main/ to deploy full 5G Core

Those entities of 5GCore and vEPCrun using kubernetes

Run vEPC network by typing :

```
cd LB-VEPC-5GCORE/vEPC-service/
helm upgrade --install  core4g -n open5gs .
```
vEPC use static IPV4 addresses , you cancheck it by typing 

```
kubectl get pods -n open5gs -owide
```

assuming that all pods are running well and you want to mount NAT LB for exemple. So we will deploy it using docker container

Finally , you can look at the log inside srsLTE_LB with full NAT pods

```
docker run -it --privileged --name mme-lb ubuntu:focal bash
```

inside de container:

```
apt-get update && apt-get install -y iptables ipvsadm iproute2 inetutils-ping fping tcpdump
sysctl -w net.ipv4.vs.conntrack=1
iptables -t nat -A POSTROUTING -o eth0 --dst 10.240.233.73 -m ipvs --ipvs --vaddr 172.17.0.2 --vport 36412 --vmethod masq -j SNAT --to-source 172.17.0.2
iptables -t nat -A POSTROUTING -o eth0 --dst 10.240.233.74 -m ipvs --ipvs --vaddr 172.17.0.2 --vport 36412 --vmethod masq -j SNAT --to-source 172.17.0.2
ipvsadm -A --sctp-service 172.17.0.2:36412 -s rr
ipvsadm -a --sctp-service 172.17.0.2:36412 -r 10.240.233.73:36412 -m
ipvsadm -a --sctp-service 172.17.0.2:36412 -r 10.240.233.73:36412 -m
```
Knowing that 
*172.17.0.2* is the IP address of the Load balancer
*10.240.233.73* , *10.240.233.74* is the IP address of the 2 MMEs

You can capture all packet inside container by :
```
tcpdump -nnni eth0 sctp port 36412
```