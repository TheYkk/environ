.PHONY: default build dependencies image

default: build

build:
	CGO_ENABLED=0 go build -a --installsuffix cgo --ldflags="-s" -o environ

dependencies:
	go mod download

image:
	docker build -t theykk/environ .