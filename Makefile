
MPATH=/usr/local/opt/gnu-tar/libexec/gnubin:$(PATH)
IMAGE=herchu/freeling4
BUILDTAG=v0
PUBLITAG=pub

Dockerfile-es: Dockerfile.m4
	m4 Dockerfile.m4 > Dockerfile-es

build-es: Dockerfile-es
	docker build -t $(IMAGE):$(BUILDTAG) -f Dockerfile-es .
	touch es-image

es-image: build-es

IMAGEID := $(shell docker images -q $(IMAGE):$(BUILDTAG))

squash: es-image
	docker save $(IMAGEID) | \
	PATH=$(MPATH) sudo docker-squash -t $(IMAGE):$(PUBLITAG) |  \
	docker load
	touch es-squashedimage
