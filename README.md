# LB-vEPC-5GCore
Load balancing implementation for vEPC and 5G Core

Repo show Load balancing with DSR IPIP .

HSS and PCRF are not available.

Please , firstly , try to read this [repo](https://bitbucket.org/infinitydon/opensource-5g-core-service-mesh/src/main/) to deploy full 5G Core

Those entities of 5GCore is using kubernetes

vEPC use static IPV4 addresses , you can check it by typing 

```
kubectl get pods -n open5gs -owide
```
We will try to go through kube loxi , This also allows us to have different load-balancers working together in the same K8s environment.

follow this [link](https://github.com/loxilb-io/kube-loxilb) to install loxilb and kube loxi.
*In my case i have installed loxilb with docker*.

after install it , change the loxiURL inside kube-loci.yaml with the good ip address coming from  the loxi docker container.
after all config are made , even load balancer service , you should have this :

![image](https://github.com/kouamdo/LB-vEPC-5GCore/assets/39982727/b862bb66-8230-4752-b85c-14f097b40308)

in the same way , try to check if your service was getting the right external-ip 

![image](https://github.com/kouamdo/LB-vEPC-5GCore/assets/39982727/fab7a0f2-ebfc-4c82-a77c-19dc6d37a09a)

So if you try to remove the static IP addresses assigned to the AMF and then create replicas and the IP address assigned inside gnb config to reach AMF (to 123.123.123.1 for example), you'll see the output and the state of the loxilb loadbalancer.

you may notice at the gnb exit:

![image](https://github.com/kouamdo/LB-vEPC-5GCore/assets/39982727/15dc8e1f-0d66-4b46-bfa7-32395f882179)

and AMF(that i have scale):

![image](https://github.com/kouamdo/LB-vEPC-5GCore/assets/39982727/d62b5a86-b5dd-47be-8554-a13d300a65aa)

So you can get the status of loxi with : 

```
docker exec -it loxilb loxicmd get ct  -o wide
```
![image](https://github.com/kouamdo/LB-vEPC-5GCore/assets/39982727/fc1d64af-eea7-4035-9e39-18b79e0d8d23)

the tool is very effective if you want to emphasize scaling, or if you want to test by creating a pod replica manually.
