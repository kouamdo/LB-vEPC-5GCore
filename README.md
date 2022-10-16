# LB-vEPC-5GCore
Load balancing implementation for vEPC and 5G Core

Repo show Load balancing with DSR IPIP .

HSS and PCRF are not available.

Please , firstly , try to read this repo https://bitbucket.org/infinitydon/opensource-5g-core-service-mesh/src/main/ to deploy full 5G Core

Those entities of 5GCore and vEPCrun using kubernetes

Run vEPC network by typing :

```
cd LB-VEPC-5GCORE/VEPC-service/
helm upgrade --install  core4g -n open5gs .
```
vEPC use static IPV4 addresses , you cancheck it by typing 

```
kubectl get pods -n open5gs -owide
```

assuming that all pods are running well and you want to mount NAT LB for exemple. So we will deploy it using docker container

Finally , you can look at the log inside srsLTE_LB pods