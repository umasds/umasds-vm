# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "umasds-vm"
  config.vm.provider "virtualbox" do |vb|
    vb.name = "umasds-vm-build"
#    vb.gui = true
    vb.memory = 1024
    vb.cpus = 2
    vb.customize ["modifyvm", :id, "--cpuexecutioncap", "95"]
    vb.customize ["modifyvm", :id, "--vram", "16"]
  end
  config.vm.provision :shell, path: "bootstrap.sh"
end
