#terminal-tools

###Installation: 

1- Clone this repo in your `/Users/username` folder

`git clone https://github.com/chongkan/homestead-hosts-updater terminalTools

2- Run the tools as: `./filename.sh` when at the same directory 

  *OR (Recommended)*

3- Export the `terminalTools` folder to your PATH in your `.profile`
  `export PATH=$PATH:/Users/eduardoc/terminalTools`
  
4- Add an alias to your `.profile` file as: 

  `alias hhu='sudo homestead-host-updater.sh'`
 
## homestead-host-updater
Updates the /etc/hosts file based on the default ~/.homestead/Homestead.yaml file. 

*USAGE:* `$ hhu`

##Expected Output* 

eduardoc-thi-mt:~ eduardoc$ hhu<br>
Password:<br><br>
Backup created at /etc/hosts.bak<br>
'-------------------------------------------'<br>
HOMESTEAD HOSTS UPDATER v1.0<br>
'-------------------------------------------'<br>
HOMESTEAD IP ->  "192.168.10.10"<br>
Added          -> homestead.app<br>
Added          -> vm.website1.local<br>
Added          -> vm.website2.local<br>
  
## Updated /etc/hosts file will be appended with

192.168.10.10	   homestead.app  #Homestead Host Updater<br>
192.168.10.10	   vm.sectorpublicocr.local  #Homestead Host Updater<br>
192.168.10.10	   vm.sparklingice.local  #Homestead Host Updater<br>
192.168.10.10	   conecom50million.dev  #Homestead Host Updater<br>
