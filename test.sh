#!/bin/bash

MKPASSWD=/usr/bin/mkpasswd

SALT_2="ab"
SALT_8="12345678"
SALT_16="${SALT_8}${SALT_8}"

PASS="notsecret"

if [ ! -x /usr/bin/mkpasswd ] ; then
	exit 0
fi

trap "echo FAILED; exit 1" ERR

try() {
	[ $($MKPASSWD "$@") = $(./mkpasswd "$@") ]
}

# Test DES
try -m des -S $SALT_2 $PASS

# Test that DES is default
#try -S $SALT_2 $PASS
[ $(./mkpasswd -S $SALT_2 $PASS) = $(./mkpasswd -m des -S $SALT_2 $PASS) ]

# Test that methods are case-insensitive
[ $(./mkpasswd -m sha-256 -S $SALT_8 $PASS) = $(./mkpasswd -m SHA-256 -S $SALT_8 $PASS) ]

# Test MD5
try -m md5 -S $SALT_8 $PASS

# Test SHA-256 & SHA-512
for hash in sha-256 sha-512 ; do
	try -m $hash -R 1000 -S $SALT_8 $PASS
	try -m $hash -R 2000 -S $SALT_16 $PASS
	try -m $hash -R 3000 -S $SALT_16 $PASS
done

[ $(echo $PASS | ./mkpasswd -m sha-256 -R 1000 -S $SALT_8 --stdin) = $(mkpasswd -m sha-256 -R 1000 -S $SALT_8 $PASS) ]
[ $(echo $PASS | ./mkpasswd -m sha-256 -R 1000 -S $SALT_8 --password-fd 0) = $(mkpasswd -m sha-256 -R 1000 -S $SALT_8 $PASS) ]

echo "PASSED"
