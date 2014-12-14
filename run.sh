#!/bin/sh

export PUBLIC_IP=$(ip addr show | grep "global eth0" | awk '{print $2}' | cut -f1 -d'/')
alias dr='sudo docker run -d'

dr -p 8001:8001 -p 5001:5001 --name node1 coreos/etcd:v0.4.6 -peer-addr ${PUBLIC_IP}:8001 -addr ${PUBLIC_IP}:5001 -name node1 -v
dr -p 8002:8002 -p 5002:5002 --name node2 coreos/etcd:v0.4.6 -peer-addr ${PUBLIC_IP}:8002 -addr ${PUBLIC_IP}:5002 -name node2 -peers ${PUBLIC_IP}:8001,${PUBLIC_IP}:8002,${PUBLIC_IP}:8003 -v
dr -p 8003:8003 -p 5003:5003 --name node3 coreos/etcd:v0.4.6 -peer-addr ${PUBLIC_IP}:8003 -addr ${PUBLIC_IP}:5003 -name node3 -peers ${PUBLIC_IP}:8001,${PUBLIC_IP}:8002,${PUBLIC_IP}:8003 -v
