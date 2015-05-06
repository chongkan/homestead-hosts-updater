#terminal-tools

###Installation: 

1- Clone this repo in your `/Users/username` folder
2- Run the tools as: ./filename.sh. 

OR (Recommended)

3- Export the `terminalTools` folder to your PATH in your `.profile`

  `export PATH=$PATH:/Users/eduardoc/terminalTools`
  
4- Add an alias to your `.profile` file as: 

  `alias hhu='sudo homestead-host-updater.sh'`
 
## homestead-host-updater
Updates the /etc/hosts file based on the default ~/.homestead/Homestead.yaml file. 

*USAGE:* `$ hhu`

*Expected Output* 

`eduardoc-thi-mt:~ eduardoc$ hhu
Password:
Backup created at /etc/hosts.bak
-------------------------------------------
HOMESTEAD HOSTS UPDATER v1.0
-------------------------------------------
HOMESTEAD IP ->  "192.168.10.10"
Added          -> homestead.app
Added          -> vm.website1.local
Added          -> vm.website2.local
