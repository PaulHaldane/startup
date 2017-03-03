#!/bin/sh

if [ ! -f README.md ]; then
	echo "No README.md file - probably not in the right place"
	exit 2
fi

tar --exclude README.md --exclude .git -cpBvf - . | ( cd ~ && tar xpBf - )
cd
chmod 755 . .ssh
cd .ssh
chmod 600 config authorized_keys
