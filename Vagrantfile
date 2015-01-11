# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "thinktainer/centos-6_6-orajdk7-puppet"

  config.vm.define "zookeeper" do |zk|
    zk.vm.hostname = 'zookeeper.local.dev'
    zk.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = 512
      vb.cpus = 1
    end

    zk.vm.network "private_network", ip: "192.168.55.1",
      virtualbox__intnet: true

    zk.ssh.forward_agent = true
    zk.vm.synced_folder "puppet", "/puppet"
    zk.vm.provision :shell, path: "git_bootstrap.sh"
    zk.vm.provision :shell, path: "r10k_bootstrap.sh"
    zk.vm.provision :puppet do |p|
      p.manifests_path = "puppet"
      p.manifest_file = "default.pp"
      p.module_path = "puppet/modules"
    end
  end

  config.vm.define "kafka-broker" do |kb|
    kb.vm.hostname = 'kb01.local.dev'
    kb.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = 1024
      vb.cpus = 1
    end
    kb.vm.network "private_network", ip: "192.168.55.10",
      virtualbox__intnet: true

    kb.ssh.forward_agent = true
    kb.vm.synced_folder "puppet", "/puppet"
    kb.vm.provision :shell, path: "git_bootstrap.sh"
    kb.vm.provision :shell, path: "r10k_bootstrap.sh"

    kb.vm.provision :puppet do |p|
      p.manifests_path = "puppet"
      p.manifest_file = "default.pp"
      p.module_path = "puppet/modules"
    end

  end
end

