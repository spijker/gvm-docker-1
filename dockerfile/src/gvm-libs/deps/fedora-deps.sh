# CENTOS - BUILD

echo "fastestmirror=true" >> /etc/dnf/dnf.conf

# base
BASE="git"
# openvas - deps
DEPS="
cmake \
gcc \
glib2-devel \
gnutls-devel \
zlib-devel \
libuuid-devel \
libssh-devel \
hiredis-devel \
libgcrypt-devel \
bison \
gpgme-devel
"
# openvas - opt
OPT="
openldap-devel \
doxygen \
xmltoman \
freeradius-devel
"

# base
dnf install -y ${BASE} ${DEPS} ${OPT}

# Remove packages
#apt remove -y ${BASE} ${DEPS} ${OPT}
dnf autoremove -y
