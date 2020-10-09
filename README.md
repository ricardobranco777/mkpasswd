# mkpasswd

This Python script emulates the `mkpasswd` command present in the `whois` package available in Debian/Ubuntu.

[![Build Status](https://travis-ci.org/ricardobranco777/tellme.svg?branch=master)](https://travis-ci.org/ricardobranco777/tellme)

## Usage

```
mkpasswd [-h] [-m {des,md5,sha-256,sha-512,help}] [-R ROUNDS] [-S SALT] [password]

  -m {des,md5,sha-256,sha-512,help}, --method {des,md5,sha-256,sha-512,help}
                        Compute the password using the TYPE method
  -R ROUNDS, --rounds ROUNDS
                        Use the specified number of rounds
  -S SALT, --salt SALT  Use the string as salt
  -P PASSWORD_FD, --password-fd PASSWORD_FD
                        Read the password from the specified file descriptor
  -s STDIN, --stdin STDIN
                        like --password-fd=0
```
