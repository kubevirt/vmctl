TAG=quay.io/fabiand/vmctl

ifdef BUILD_NEXT
build:
	buildah bud -t $(TAG) .

run:
	podman run --rm -it --entrypoint /bin/sh --privileged quay.io/fabiand/vmctl

push:
	echo
endif

submodules:
	git submodule update --init --recursive

build:
	docker build -t $(TAG) .

build-go: format
	cd cmd/vmctl ;\
	go build vmctl.go

format:
	go fmt cmd/vmctl/vmctl.go

.PHONY: format docker
