#!/bin/bash

set -euf

RESTART=0

# check for upgrades that need a reboot
if xbps-install -n -Mu | grep -qE '^(linux5\.|void)'; then
	RESTART=1
fi

# upgrade all packages
echo "************************** Upgrade ******************************"
xbps-install -Suy

# cleanup orphan packages
echo "*********************** Remove Orphans **************************"
xbps-query -O | xargs --no-run-if-empty sudo xbps-remove

# cleanup old kernels
echo "********************** Purge old kernels ************************"
#vkpurge rm all

# list services to be restarted
#su -s /bin/sh -c xcheckrestart nobody
#xcheckrestart

echo "****************** Programs that need restart *******************"
/home/jbenden/bin/xcheckrestart | cut -d' ' -f2 | sort | uniq

if [ $RESTART -ne 0 ]; then
	echo "*********************** RESTART REQUIRED ************************"
fi

# DONE
exit 0

#
# UBUNTU or DEBIAN
#

echo "I: Gathering APT repository updates..."
env DEBIAN_FRONTEND=noninteractive apt-get -qq update

echo "I: Remounting partitions..."
mount -o rw,remount /boot
mount -o exec,remount /tmp

function ondone()
{
	local _rc=$1

	echo "I: Remounting partitions..."
	mount -o ro,remount /boot
	mount -o noexec,remount /tmp

	exit $_rc
}
trap "ondone \$?" EXIT

if [ 1 -eq 1 ]; then
echo "I: Looking for kernel upgrade..."
if env DEBIAN_FRONTEND=noninteractive apt list -q --upgradable | grep -qE '^(linux-|intel-|grub-|fwupdate-|fwupd|firmware-|efibootmgr|amd64-microcode|initramfs-)'; then
	CNT=$(find /boot -name 'vmlinuz-*' 2>/dev/null | sort -V | wc -l)

	if [ $CNT -ge 2 ]; then
		echo "I: Uninstalling oldest kernel..."

		KERNEL=$(find /boot -name 'vmlinuz-*' 2>/dev/null | sort -V | head -n 1 | xargs dpkg -S | cut -d: -f1)

		echo "I: Uninstalling $KERNEL"
	else
		echo "W: Less than two kernels exist!"
	fi
else
	echo "W: No kernel upgrade is available."
fi
fi

echo "I: Upgrading packages..."
env DEBIAN_FRONTEND=noninteractive apt dist-upgrade -y

echo "I: Cleaning packages..."
env DEBIAN_FRONTEND=noninteractive apt autoremove -y
env DEBIAN_FRONTEND=noninteractive apt autoclean -y


echo "I: Done."
exit 0
