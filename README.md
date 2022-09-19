# mkpasswd

This Python script emulates the `mkpasswd` command present in the `whois` package available in Debian/Ubuntu.

[![Build Status](https://travis-ci.com/ricardobranco777/mkpasswd.svg?branch=master)](https://travis-ci.org/ricardobranco777/mkpasswd)

## Usage

```
usage: mkpasswd [-h] [-m METHOD] [-R ROUNDS] [-S SALT] [-P PASSWORD_FD] [-s] [password]

positional arguments:
  password

options:
  -h, --help            show this help message and exit
  -m METHOD, --method METHOD
                        Compute the password using the TYPE method
  -R ROUNDS, --rounds ROUNDS
                        Use the specified number of rounds
  -S SALT, --salt SALT  Use the string as salt
  -P PASSWORD_FD, --password-fd PASSWORD_FD
                        Read the password from the specified file descriptor
  -s, --stdin           like --password-fd=0
```

## Requirements

- Python 3.6+
- [hashlib](https://passlib.readthedocs.io/)
- argon2_cffi for argon2

## Methods

NOTES:
  - You can skip `_crypt`

```
$ ./mkpasswd -m help
Available methods:
apr_md5_crypt
argon2
atlassian_pbkdf2_sha1
bcrypt
bcrypt_sha256
bigcrypt
bsd_nthash
bsdi_crypt
cisco_asa
cisco_pix
cisco_type7
crypt16
cta_pbkdf2_sha1
des_crypt
django_argon2
django_bcrypt
django_bcrypt_sha256
django_des_crypt
django_disabled
django_pbkdf2_sha1
django_pbkdf2_sha256
django_salted_md5
django_salted_sha1
dlitz_pbkdf2_sha1
fshp
grub_pbkdf2_sha512
hex_md4
hex_md5
hex_sha1
hex_sha256
hex_sha512
ldap_bcrypt
ldap_bsdi_crypt
ldap_des_crypt
ldap_hex_md5
ldap_hex_sha1
ldap_md5
ldap_md5_crypt
ldap_pbkdf2_sha1
ldap_pbkdf2_sha256
ldap_pbkdf2_sha512
ldap_plaintext
ldap_salted_md5
ldap_salted_sha1
ldap_salted_sha256
ldap_salted_sha512
ldap_sha1
ldap_sha1_crypt
ldap_sha256_crypt
ldap_sha512_crypt
lmhash
md5_crypt
mssql2000
mssql2005
mysql323
mysql41
nthash
oracle11
pbkdf2_sha1
pbkdf2_sha256
pbkdf2_sha512
phpass
plaintext
scram
scrypt
sha1_crypt
sha256_crypt
sha512_crypt
sun_md5_crypt
```
