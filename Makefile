
MPATH=/usr/local/opt/gnu-tar/libexec/gnubin:$(PATH)
IMAGE=herchu/freeling4
BUILDTAG=v0
PUBLITAG=pub

Dockerfile-es: Dockerfile.m4
	m4 --define fl-es Dockerfile.m4 > Dockerfile-es

build-es: Dockerfile-es
	docker build -t $(IMAGE)-es:$(BUILDTAG) -f Dockerfile-es .
	touch es-image

es-image: build-es

IMAGEID := $(shell docker images -q $(IMAGE)-es:$(BUILDTAG))

squash-es: es-image
	docker save $(IMAGEID) | \
	PATH=$(MPATH) sudo docker-squash -t $(IMAGE)-es:$(PUBLITAG) |  \
	docker load
	touch es-squashedimage
