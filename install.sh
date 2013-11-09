#!/bin/bash

#Make sure the user is root.

if [ $EUID -ne 0 ]; then

	echo "You must be root to run this script."
	exit 1

fi

echo "This script will install the init script for BitlBee, and create the necessary run directory."
sleep 2

echo "Checking for to see if an init script already exists..."

if [ ! -f /etc/init.d/bitlbee ]; then

	echo "The init script doesn't exist, installing..."
	cp ./init-script/bitlbee /etc/init.d/bitlbee
	sleep 1
	chmod 755 /etc/init.d/bitlbee
	echo "The init script has been installed."

else 

	echo "It looks like the init script already exists. Leaving as is."
	exit 1

fi

sleep 1

echo "Checking for run directory"

if [ ! -d /var/run/bitlbee ]; then

	echo "Creating the BitlBee run directory."
	mkdir -p /var/run/bitlbee

else

	echo "The run directory already exists."
	exit 0

fi
