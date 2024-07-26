#!/bin/bash
set -e
cd "$(dirname "$(realpath "$0")")"

ProfileDir=$(echo ~/.mozilla/firefox/$(ls ~/.mozilla/firefox | grep '\.default-release$'))

curl -o user.js https://raw.githubusercontent.com/arkenfox/user.js/master/user.js > /dev/null 2>&1
curl -o PrefsCleaner.sh https://raw.githubusercontent.com/arkenfox/user.js/master/prefsCleaner.sh > /dev/null 2>&1
chmod +x PrefsCleaner.sh
echo "Curled User.js"

cat overrides.js >> user.js
rm -f -- "$ProfileDir"/user.js
rm -f -- "$ProfileDir"/PrefsCleaner.sh
mv user.js "$ProfileDir"
mv PrefsCleaner.sh "$ProfileDir"
"$ProfileDir"/PrefsCleaner.sh -s -d > /dev/null
echo "Updated Preferences"

