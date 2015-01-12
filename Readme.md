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
