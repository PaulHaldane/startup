#!/bin/sh

if [ ! -f README.md ]; then
	echo "No README.md file - probably not in the right place"
	exit 2
fi

tar --exclude README.md --exclude .git -cpBvf - . | ( cd ~ && tar xpBf - )

cd
chmod 755 . .ssh
cd .ssh

akeys=authorized_keys
akeys_combined=${akeys}_$$
akeys_add=${akeys}_add

if [ -s $akeys ]; then
	cat $akeys_add $akeys | sort -u > $akeys_combined
	if diff $akeys $akeys_combined > /dev/null ; then
		rm $akeys_combined
	else
		mv $akeys_combined $akeys
	fi
else
	mv $akeys_add $akeys
fi

chmod 600 config $akeys
