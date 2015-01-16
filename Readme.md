# Vagrant kafka
A multi machine vagrant / puppet set up that spins up a
[zookeeper](http://zookeeper.apache.org) instance
and a [kafka](http://kafka.apache.org) broker.

## Prerequisites
- A working ssh environment on the host machine that allows connecting
  to github via ssh
- A running ssh agent on the host machine. Instructions
  [here](https://gist.github.com/ahawthorne/1691514)
- [Vagrant](https://www.vagrantup.com/downloads.html)
- [Virtualbox](https://www.virtualbox.org/wiki/Downloads)

## Run

Run `vagrant up --provider=virtualbox`

	vagrant ssh kafka-broker
	cd /usr/local/kafka/kafka


## Configure kafka-web-console

This will give you a web interface listening on localhost:9000.
You can then register your running zookeeper instance in the web console
with:

- ip: `192.168.55.1`
- port: `2181`
- name: doesn't matter
- group: doesn't matter


## Service management

See [service management documentation](doc/service_management)



