#!/usr/bin/env bash

# DEBIAN - BUILD

# gvm-libs

# base
BASE="
git
cmake
gcc
make
pkg-config
"
# nodejs
BASE="${BASE} curl"

# deps
DEPS="
libglib2.0-dev
libgnutls28-dev
libmicrohttpd-dev
gettext
python-polib
libxml2-dev
"

# opt
OPT="
doxygen
xmltoman
"

apt update -y && \
apt install -y --no-install-recommends --fix-missing ${BASE} ${DEPS} ${OPT}

# nodejs
curl --silent --show-error https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb http://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
curl --silent --show-error https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
echo "deb http://deb.nodesource.com/node_6.x jessie main" | tee /etc/apt/sources.list.d/nodesource.list
apt-get update -y
apt-get install -y nodejs yarn

# Remove packages
#apt remove -y ${BASE} ${DEPS} ${OPT}
apt autoremove -y
rm -rf /var/lib/apt/lists/*