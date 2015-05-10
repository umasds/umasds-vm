*This project is still under heavy development!*

![Social Data Science](conf/sds.png)
# The **Social Data Science** VM
## An easy to use virtual machine (VM) for teaching data science in the social sciences

## Usage
### 1. Install necessary tools
* Install VirtualBox: https://www.virtualbox.org/wiki/Downloads
* Install Vagrant: https://www.vagrantup.com/downloads.html

### 2. Prepare the VM
* Start a terminal
* Create a new directory a navigate to it:

```
$ mkdir umasds-vm
$ cd umasds-vm
```
* Initialize the VM:

```
$ vagrant init http://bethm.de/umasds-vm/package.box
```

* Use a text editor to replace the content of `Vagrantfile` with:

```
# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure(2) do |config|
  config.vm.box = "http://bethm.de/umasds-vm/package.box"
  config.vm.hostname = "umasds-vm"
  config.vm.provider "virtualbox" do |vb|
    vb.gui = true
  end
end
```
### 3. Download and run the VM

```
$ vagrant up
```
* After a while the **Social Data Science** desktop should come up and you 
 can start crunching data!