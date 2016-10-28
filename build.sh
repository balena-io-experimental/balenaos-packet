#!/bin/sh

version=$RESIN_OS_VERSION
image=resin/resinos:$version


docker pull $image
docker save $image > image.tar
which packet-save2image
echo $PATH
chmod +x /bin/packet-save2image
/bin/packet-save2image -v image.tar

ls -lah /tmp

