# LB-vEPC-5GCore
Load balancing implementation for vEPC and 5G Core

Repo show Load balancing with DSR IPIP .

HSS and PCRF are not available.

Please , firstly , try to read this repo https://bitbucket.org/infinitydon/opensource-5g-core-service-mesh/src/main/ to deploy full 5G Core

Those entities of 5GCore and vEPCrun using kubernetes

Run vEPC network by typing :

```
cd LB-VEPC-5GCORE/vEPC-service/
helm upgrade --install  core5g -n open5gs .
```
vEPC use static IPV4 addresses , you can check it by typing 

```
kubectl get pods -n open5gs -owide
```
We will try to go through kube loxi , This also allows us to have different load-balancers working together in the same K8s environment.

follow this [link](https://github.com/loxilb-io/kube-loxilb) to install loxilb and kube loxi.
*In my case i have installed loxilb with docker*.

after installe it , change the loxiURL inside kube-loci.yaml with the good ip address coming from  the loxi docker container.
after all config are made , even load balancer service , you should have this :
![image](https://github.com/kouamdo/LB-vEPC-5GCore/assets/39982727/b862bb66-8230-4752-b85c-14f097b40308)

So you can get the status wuith : 

```
docker exec -it loxilb loxicmd get ct  -o wide
```


