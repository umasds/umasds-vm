*This project is still under heavy development!*

![Social Data Science](conf/sds.png)
# The **Social Data Science** VM
## An easy to use virtual machine (VM) for teaching data science in the social 
 sciences

## Usage
### 1. Install necessary tools
* Install VirtualBox: https://www.virtualbox.org/wiki/Downloads
* Install Vagrant: https://www.vagrantup.com/downloads.html

### 2. Prepare the VM
* Start a terminal
  - *Ubuntu Linux*: press *command/Windows/Apple key* > type `terminal` > hit 
   *enter*
  - *MacOS X*: press *command/Windows/Apple key* + *space* > type `Terminal` > 
   double click *Terminal* in the results
  - *Windows*: press *command/Windows/Apple key* > type `cmd` > hit *enter*

* To create a new directory and navigate to it type the following commands into 
 the terminal and hit *enter* after each line:

*Ubuntu Linux* and *MacOS X*: 

```
mkdir ~/umasds-vm
cd ~/umasds-vm
```

*Windows*: 

```
mkdir %HOMEPATH%/umasds-vm
cd %HOMEPATH%/umasds-vm
```

* Initialize the VM:

*all operating systems*: 

```
vagrant init http://bethm.de/umasds-vm/umasds-vm.box
```

### 3. Download and run the VM

*all operating systems*: 

```
vagrant up
```

* After a while the **Social Data Science** desktop should come up and you 
 can start crunching data!