# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "thinktainer/centos-6_6-orajdk7-puppet"

  config.vm.define "kafka-broker" do |kb|
    kb.vm.hostname = 'kb01.local.dev'
    kb.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = 2048
      vb.cpus = 1
    end

    kb.vm.network "forwarded_port", guest: 9000, host: 9000
    kb.vm.network "private_network", ip: "192.168.55.10"

    kb.ssh.forward_agent = true

  end

  config.vm.synced_folder "puppet", "/puppet"
  config.vm.provision :shell, path: "git_bootstrap.sh"
  config.vm.provision :shell, path: "r10k_bootstrap.sh"

  config.vm.provision :puppet do |p|
    p.manifests_path = "puppet"
    p.manifest_file = "default.pp"
    p.module_path = "puppet/modules"
    p.hiera_config_path = "puppet/hiera/hiera.yaml"
    p.working_directory = "/puppet/hiera"
  end
end

