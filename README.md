# The **Social Data Science** VM
## An easy to use virtual machine for teaching data science

## Usage
1. Install VirtualBox
2. Install Vagrant
3. Create a new directory for the VM
4. Start a terminal and change to the directory on the command line
5. Run `vagrant init http://bethm.de/umasds-vm/package.box`
6. Replace content of `Vagrantfile` with:
```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "/home/arne/umasds-vm/package.box"
  config.vm.hostname = "umasds-vm"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
  end
end
```
7. Run `vagrant up` on the command line and wait ...
8. You should now see a new window with the **Social Data Science** desktop