# Vagrant kafka
A multi machine vagrant / puppet set up that spins up a zookeeper instance
anda a kafka broker.

## Prerequisites
- A working ssh environment on the host machine that allows connecting
  to github via ssh
- A running ssh agent on the host machine. Instructions
  [here](https://gist.github.com/ahawthorne/1691514)
- [Vagrant](https://www.vagrantup.com/downloads.html)
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

## Run
Run `vagrant up --provider=virtualbox`

This will give you a web interface listening on localhost:9000.
You can then register your running zookeeper instance in the web console
with:

- ip: `192.168.55.1`
- port: `2181`
- name: doesn't matter
- group: doesn't matter

## To restart services

### kafka-web-console

		vagrant ssh zookeeper
		sudo su playframework
		cd ~/kafka-web-console
		play start
		[ctrl]-d
		[ctrl]-d

### zookeeper

		vagrant ssh zookeeper
		sudo service zookeeper-server restart
		[ctrl]-d

### kafka broker

		vagrant ssh kafka-broker
		sudo service kafka restart
		[ctrl]-d


