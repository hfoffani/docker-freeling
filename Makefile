
MPATH=/usr/local/opt/gnu-tar/libexec/gnubin:$(PATH)
IMAGE=herchu/freeling4
BUILDTAG=v0
PUBLITAG=pub
DOCKERCFG=dependencies.docker freeling.docker locale.docker


Dockerfile-es: Dockerfile.m4 $(DOCKERCFG) python.docker pyfreeling.docker es-config.docker
	svn export --force -q https://github.com/TALP-UPC/FreeLing.git/tags/4.0-beta1/APIs/python APIs/python
	svn export --force -q https://github.com/TALP-UPC/FreeLing.git/tags/4.0-beta1/APIs/common APIs/common
	m4 --define=py-dv --define=fl-es Dockerfile.m4 > Dockerfile-es

build-es: Dockerfile-es
	docker build -t $(IMAGE)-es:$(BUILDTAG) -f Dockerfile-es .
	touch build-es


clean:
	rm -f Dockerfile-es build-es squash-es


## because docker-squash must run as root it asks its password
squash-es: build-es
	$(eval IMAGEID = $(shell docker images -q $(IMAGE)-es:$(BUILDTAG))) \
	docker save $(IMAGEID) | \
	PATH=$(MPATH) sudo docker-squash -t $(IMAGE)-es:$(PUBLITAG) |  \
	docker load
	touch squash-es

publish-es: squash-es
	docker push $(IMAGE)-es:$(PUBLITAG)
