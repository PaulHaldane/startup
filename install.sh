#!/bin/sh

if [ ! -f README.md ]; then
	echo "No README.md file - probably not in the right place"
	exit 2
fi

tar --exclude README.md --exclude .git -cpBvf - . | ( cd ~ && tar xpBf - )
