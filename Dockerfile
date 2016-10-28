FROM library/docker:1.12.1

RUN apk update && apk add bash wget tar jq

RUN mkdir /usr/src
WORKDIR /usr/src

RUN wget -O /bin/packet-save2image \
	https://raw.githubusercontent.com/packethost/packet-images/master/tools/packet-save2image \
	&& chmod +x /bin/packet-save2image

COPY build.sh .

RUN chmod +x build.sh

ENTRYPOINT /usr/src/build.sh

WORKDIR /build

