#!/bin/bash

if nmcli con show --active | grep -q "Wired connection 1"; then
	nmcli con up "VM1194885"
	nmcli con down "Wired connection 1"
else
	nmcli con up "Wired connection 1"
	nmcli con down "VM1194885"
fi
