
MPATH=/usr/local/opt/gnu-tar/libexec/gnubin:$(PATH)
IMAGE=herchu/freeling4
BUILDTAG=v0
PUBLITAG=pub

Dockerfile: Dockerfile.m4
	m4 Dockerfile.m4 > Dockerfile

build: Dockerfile
	docker build -t $(IMAGE):$(BUILDTAG) .
	touch image

IMAGEID := $(shell docker images -q $(IMAGE):$(BUILDTAG))

squash: image
	docker save $(IMAGEID) | \
	PATH=$(MPATH) sudo docker-squash -t $(IMAGE):$(PUBLITAG) |  \
	docker load
