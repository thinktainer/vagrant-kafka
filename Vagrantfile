# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "thinktainer/centos-6_6-orajdk7-puppet"
  #config.vm.define "kafka" do |kk|
    #kk.hostname = 'kafka'
    #kk.vm.provider "virtualbox" do |vb|
      #vb.gui = false
      #vb.memory = 2048
      #vb.cpus = 1
    #end
  #end
  config.vm.define "zookeeper" do |zk|
    zk.vm.hostname = 'zookeeper'
    zk.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = 512
      vb.cpus = 1
    end
    zk.ssh.forward_agent = true
    zk.vm.synced_folder "puppet", "/puppet"
    zk.vm.provision :shell, path: "git_bootstrap.sh"
    zk.vm.provision :shell, path: "r10k_bootstrap.sh"
    #zk.vm.provision :puppet do |p|
    #end
  end
end

