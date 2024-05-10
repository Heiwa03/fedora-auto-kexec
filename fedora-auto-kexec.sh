#!/bin/bash

current_initrd=--initrd=$(grubby --info DEFAULT | grep -oP '(?<=initrd=").*(?=")')
echo "current_initrd: $current_initrd"

current_boot=$(grubby --info DEFAULT | grep -oP '(?<=kernel=").*(?=")')
echo "current_boot: $current_boot"

current_cmdline=$(grubby --info DEFAULT | grep -oP '(?<=args=").*(?=")')
echo "current_cmdline: $current_cmdline"

if [ -z "$current_initrd" ]; then
	echo "No initrd found"
	exit 1
fi

if [ -z "$current_boot" ]; then
	echo "No boot found"
	exit 1
fi

if [ -z "$current_cmdline" ]; then
	echo "No cmdline found"
	exit 1
fi

echo "Rebooting to $current_boot with $current_initrd and $current_cmdline"

kexec -l $current_boot $current_initrd --append="$current_cmdline"
kexec -e

