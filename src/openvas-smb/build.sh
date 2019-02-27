# Install openvas-smb
APP="openvas-smb"

VERSION="${1}"

[ "${VERSION}" == "release" ] && CHECKOUT="tags/v1.0.4"
[ "${VERSION}" == "dev" ] && CHECKOUT="0de34e356127d8889dbf8d839a80976c3d124bf2"

git clone https://github.com/greenbone/${APP}.git \
&& cd ${APP} \
&& git checkout ${CHECKOUT} . \
&& mkdir -p build \
&& cd build \
&& cmake .. \
&& make \
&& make install
