#!/bin/bash

set -eufx

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

echo "I: Looking for kernel upgrade..."
if env DEBIAN_FRONTEND=noninteractive apt list -q --upgradable | grep -qE '^(linux-|intel-|grub-|fwupdate-|fwupd|firmware-|efibootmgr|amd64-microcode)'; then
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

echo "I: Upgrading packages..."
env DEBIAN_FRONTEND=noninteractive apt dist-upgrade -y

echo "I: Cleaning packages..."
env DEBIAN_FRONTEND=noninteractive apt autoremove -y


echo "I: Done."
exit 0
