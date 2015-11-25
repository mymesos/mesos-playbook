#!/bin/sh
mkdir -p roles
cd roles
git clone https://github.com/mymesos/ansible-docker
git clone https://github.com/AnsibleShipyard/ansible-java
git clone https://github.com/mymesos/ansible-zookeeper
git clone https://github.com/mymesos/ansible-mesos
git clone https://github.com/mymesos/ansible-marathon