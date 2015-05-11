*This project is still under heavy development!*

![Social Data Science](conf/sds.png)
# The **Social Data Science** VM
## An easy to use virtual machine (VM) for teaching data science in the social sciences

## **Installation and setup**
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

### 3. Download and run the VM for the first time

*all operating systems*: 

```
vagrant up
```

* After a while the **Social Data Science** desktop should come up and you 
 can start crunching data!

### 4. Starting the VM
* You can always start the VM by opening a *terminal*, changing to the 
 `umasds-vm` directory and starting `vagrant up` manually ...
* ... but if you want a more convenient way you can easily set up a shortcut on 
  the desktop (*all operating systems*):
  1. Start the *Oracle VM VirtualBox Manager* - much like you started the 
    terminal above, just type in `oracle` instead
  2. Do a right click on *umasds-vm* > click left on *Create Shortcut on Desktop*
  3. ... et voilà! Anytime you want to start the VM now you just need to double
    click on the *umasds-vm* icon (blue cube saying "vbox") on the desktop

### 5. Stopping the VM
* Just click on the shutdown icon (red square with white circle) in the lower 
  right corner > click on *Shut down*