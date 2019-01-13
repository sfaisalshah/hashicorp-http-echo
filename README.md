**http-echo**
---
This repository contains files to deploy http-echo application on docker swarm with nginx as reverse proxy.

Docker swarm is used to deploy the http-echo application as it allows to scale and update the services seemlessly. Service load balancing is also managed internally.  

## Requirements

This project is tested on VirtualBox Build 5.2.22 and Vagrant 2.2.2, install [VirtualBox Build 5.2.22](https://www.virtualbox.org/wiki/Download_Old_Builds_5_2) and [Vagrant](https://www.vagrantup.com/downloads.html)  on your local system. Once vagrant is installed, install vbguest plugin as well using below command.

```bash
vagrant plugin install vagrant-vbguest
```

## Usage
---
Clone this repository, and execute run.sh

```bash
./run.sh
```
---

This will provision a swarm cluster with one manager and three workers. Nginx is used as reverse proxy, SSL and http to https redirection is also configured on nginx.

You can hit any IP of node in swarm cluster (on port 80) and it will forward the request to http-echo backend service.

IP's are: 10.10.10.10, 10.10.10.11, 10.10.10.12, and 10.10.10.13

http-echo service can be scaled using docker service scale app=<NUMBER> command from master node, 3 instances of this service will be running by default for HA.

## Improvements

This is sample infrastructure and has scope for alot of improvements. Backend service can be isolated from outside world to respond to requests coming from nginx service. By default, only one instance of nginx is running, this can be increased for HA. Master nodes can also be increased for HA. This is not done due to local environment. 
If we increase the scope of this project, consul can be used for service discovery and KV store.
