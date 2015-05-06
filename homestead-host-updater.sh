
#!/bin/bash

HOSTSFILE="/etc/hosts"
BAKFILE="$HOSTSFILE.bak"
DOMAINREGEX="^[a-zA-Z0-9]{1}[a-zA-Z0-9\.\-]+$"
IPREGEX="^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$"

backup()
{
  echo "Backup created at $BAKFILE";
	cat $HOSTSFILE > $BAKFILE
}
#-------------------------------------------------
isroot()
{
	# Check for root user
	if [ $(whoami) != "root" ]; then
	  echo "-------------------------------------------";
	  echo "HOMESTEAD HOSTS UPDATER v1.0"
	  echo "-------------------------------------------";
	  echo "hhu must be run as root... Add your hosts manually or re-run the last command with sudo"; echo;
	  exit 192
	fi
}
isroot
#-------------------------------------------------

function addHost()
{
	# Do we have enough arguments?
	if [ ! $# == 2 ]; then
		echo "Missing arguments: $0 add [host] [ip]"; echo;
		exit 192
	fi

	# Does the host look valid?
	if [[ ! $1 =~ $DOMAINREGEX ]]; then
		echo "Invalid hostname: $2"; echo;
		exit 192
	fi

	# Does the IP look valid?
	if [[ ! $2 =~ $IPREGEX ]]; then
		echo "Invalid IP address: $3"; echo;
		exit 192
	fi

	# Check to see if the host is already in the file	
	if grep -q $1 "$HOSTSFILE"; then
   		echo "NOT ADDED: The host $1 is already in the hosts file.";
	  	#exit 192
 	else
		echo "$2\t$1  #Homestead Host Updater" >> $HOSTSFILE
		echo "Added          -> $1";
	fi

}
#-------------------------------------------------
IFS=':'
HOMESTEAD_YAML=~/.homestead/Homestead.yaml 
# Backup the File
backup

echo "-------------------------------------------";
echo "HOMESTEAD HOSTS UPDATER v1.0"
echo "-------------------------------------------";

#Site added by HOMESTEAD HOSTS UPDATER
echo "\n" >> $HOSTSFILE

while read -r yamlLine; do
	if [[ $yamlLine == ip:* ]]; then 
		IFS=' ' read -a mapLine <<< "$yamlLine"
        
        homesteadIP="${mapLine[1]//\"}";
		#homesteadIP="${homesteadIP#\"}";
		echo "HOMESTEAD IP -> " $homesteadIP;

	fi



	if [[ $yamlLine == sites* ]]; then 
		inSites="true";
	fi
	# Only for sites
    if [[ $yamlLine == *" map:"* ]] &&  [[ "$inSites" = "true" ]]; then
        	IFS=' ' read -a mapLine <<< "$yamlLine"
        	# echo "VALUE->" ${mapLine[2]}
        	# Add host 
        	addHost ${mapLine[2]} $homesteadIP
    fi
        	
done < "$HOMESTEAD_YAML"
