IMAGE=localhost/resinos-packet:latest

build:
	docker build -t ${IMAGE} .

run: build
	docker run -it --rm -e RESIN_OS_VERSION=1.16.0-intel-nuc \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v $$(pwd)/artifacts:/build \
		${IMAGE}

shell: build
	docker run -it --rm --entrypoint /bin/sh -v /var/run/docker.sock:/var/run/docker.sock ${IMAGE}

