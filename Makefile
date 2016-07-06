
MPATH=/usr/local/opt/gnu-tar/libexec/gnubin:$(PATH)
IMAGE=herchu/freeling4
BUILDTAG=v0
PUBLITAG=pub
DOCKERCFG=dependencies.docker freeling.docker locale.docker

Dockerfile-es: Dockerfile.m4 $(DOCKERCFG) es-config.docker
	m4 --define=fl-es Dockerfile.m4 > Dockerfile-es

Dockerfile-pyes: Dockerfile.m4 $(DOCKERCFG) python.docker
	m4 --define=py-dv --define=fl-es Dockerfile.m4 > Dockerfile-pyes

build-es: Dockerfile-es
	docker build -t $(IMAGE)-es:$(BUILDTAG) -f Dockerfile-es .
	touch build-es

build-pyes: Dockerfile-pyes
	docker build -t $(IMAGE)-pyes:$(BUILDTAG) -f Dockerfile-pyes .
	touch build-pyes

IMAGEID := $(shell docker images -q $(IMAGE)-es:$(BUILDTAG))

squash-es: build-es
	docker save $(IMAGEID) | \
	PATH=$(MPATH) sudo docker-squash -t $(IMAGE)-es:$(PUBLITAG) |  \
	docker load
	touch squash-es

publish-es: squash-es
	docker push $(IMAGE)-es:$(PUBLITAG)
