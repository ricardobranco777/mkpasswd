#!/bin/bash -e

MKPASSWD=/usr/bin/mkpasswd

SALT_2="ab"
SALT_8="12345678"
SALT_16="${SALT_8}${SALT_8}"

PASS="notsecret"

if [ ! -x /usr/bin/mkpasswd ] ; then
	exit 0
fi

try() {
	[ $($MKPASSWD "$@") = $(./mkpasswd "$@") ]
}

# Test DES
try -m des -S $SALT_2 $PASS

# Test that DES is default
try -S $SALT_2 $PASS
[ $(./mkpasswd -S $SALT_2 $PASS) = $(./mkpasswd -m des -S $SALT_2 $PASS) ]

# Test that methods are case-insensitive
[ $(./mkpasswd -m des -S $SALT_2 $PASS) = $(./mkpasswd -m DES -S $SALT_2 $PASS) ]

# Test MD5
try -m md5 -S $SALT_8 $PASS

# DES & MD5 should ignore -R
[ $(./mkpasswd -m des -S $SALT_2 $PASS) = $(./mkpasswd -m DES -S $SALT_2 -R 1000 $PASS) ]
[ $(./mkpasswd -m md5 -S $SALT_8 $PASS) = $(./mkpasswd -m MD5 -S $SALT_8 -R 1000 $PASS) ]

# Test SHA-256 & SHA-512
for hash in sha-256 sha-512 ; do
	try -m $hash -S $SALT_8 $PASS
	try -m $hash -S $SALT_16 $PASS
	try -m $hash -S $SALT_16 -R 5000 $PASS
done

echo "PASSED"
