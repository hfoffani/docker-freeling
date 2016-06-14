
Dockerfile: Dockerfile.m4
	m4 Dockerfile.m4 > Dockerfile

build: Dockerfile
	docker build -t herchu/freeling4:v0 .
