# LB-vEPC-5GCore
Load balancing implementation for vEPC and 5G Core

Repo show Load balancing with DSR IPIP .

HSS and PCRF are not available.

Please try to read this repo https://bitbucket.org/infinitydon/opensource-5g-core-service-mesh/src/main/ to deploy full 5G Core

Those entities of 5GCore and vEPCrun using kubernetes

Run vEPC network by typing :

```
helm upgrade --install -n core4g-n open5gs vEPC/open5gs-helm/
```
vEPC use static IPV4 addresses , you cancheck it by typing 

```
kubectl get pods -n ope5gs -owide
```

assuming that all pods are running well and you want to mount NAT LB for exemple. So we will deploy it using docker container

Create docker LB container

```
docker run -it --name mme-lb --privileged ubuntu:focal
```

```
cat << EOF > ./account.js

EOF
```



To have more about tracability see the LB by typing in another terminal :

```
kubectl logs mme-lb
```