#!/bin/bash

if nmcli con show --active | grep -q "Wired connection 1"; then
	nmcli con up "Wired connection 2"
	nmcli con down "Wired connection 1"
else
	nmcli con up "Wired connection 1"
	nmcli con down "Wired connection 2"
fi
