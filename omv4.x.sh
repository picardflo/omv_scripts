#!/bin/bash

###################################################################
##           .:: Script d'installation OMV4.x ::.                ##
###################################################################
##            .:: Script by Florian PICARD ::.                   ##
###################################################################

if [ $(id -u) -eq 0 ];
then

	echo "+------------------------------------------------------------+"
	echo "| Install Tools and Softwares                                |"
	echo "+------------------------------------------------------------+"
	sleep 5

	## From official Repositories
	apt install mc --yes
	apt install vim --yes
	apt install git --yes
	apt install tree --yes
	apt install zip --yes
	apt install unrar --yes
	apt install nmap --yes
	apt install htop --yes
	apt install make --yes
	apt install gcc --yes
	apt install slurm --yes
	apt install bmon --yes
	apt install iftop --yes
	apt install dos2unix --yes
	apt install apt-transport-https --yes
	apt install hardinfo --yes
	apt install acpi --yes
	apt install net-tools --yes

	# ManPages - Help pages.
	apt install man-db --yes
	apt install manpages-fr --yes
	apt install manpages-fr-extra --yes


	## From ppa or external Repositories

	#OVM extras
	wget --directory-prefix=/tmp http://omv-extras.org/openmediavault-omvextrasorg_latest_all4.deb
	dpkg --force-depends --install /tmp/openmediavault-omvextrasorg_latest_all4.deb
	rm --force /tmp/openmediavault-omvextrasorg_latest_all4.deb

	# Install extras
	apt update
	apt install --yes openmediavault-omvextrasorg
	apt install --yes openmediavault-remotemount
	apt install --yes openmediavault-downloader
	apt install --yes openmediavault-duplicati
	apt install --yes openmediavault-lvm2
	apt install --yes openmediavault-snmp
	apt install --yes openmediavault-usbbackup
	apt install --yes openmediavault-symlinks
	apt install --yes openmediavault-clamav

	echo "+------------------------------------------------------------+"
	echo "| Update OS and clean OS                                     |"
	echo "+------------------------------------------------------------+"
	sleep 5

	# Update OS
	apt update
	apt upgrade --yes
	apt autoclean --yes
	apt autoremove --yes

	echo "+------------------------------------------------------------+"
	echo "| Init OMV System                                            |"
	echo "+------------------------------------------------------------+"
	sleep 5

	omv-initsystem


	echo "+------------------------------------------------------------+"
	echo "| Reboot if required                                         |"
	echo "+------------------------------------------------------------+"
	sleep 5

	if [ -f /var/run/reboot-required ]; then
		echo 'Redemarrage dans 10 secondes - Ctrl+C pour annuler'
		sleep 10
		reboot
	fi
fi
