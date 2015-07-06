#!/bin/bash -
# Install scripts and exit

AUTHOR="Bernard Lim <lim.yiok.kia@gmail.com"
PROG=$(basename $0)
VERSION=1.0

die() {
  echo "$PROG: $*" >&2
  exit 1
}

# preferred location
if [ -d "/usr/local/bin" ]; then
  DEST="/usr/local/bin"
else
  DEST="/usr/bin"
fi

# must be root to run
if [ $(id -u) -ne 0 ]; then
  die "You must be root to run this"
fi

# copy files
find . -maxdepth 1 -type f -a -executable -a -not -name "*install*" -exec cp {} $DEST \;
