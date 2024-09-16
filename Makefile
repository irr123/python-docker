IMAGE      ?= c1rno/python
VERSION    ?= latest
BASE_IMAGE ?= python:3.12.6-slim-bookworm

.PHONY: build
build:
	docker buildx build \
		--platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
		--build-arg BASE_IMAGE=${BASE_IMAGE} \
		--tag ${IMAGE}:${VERSION} \
		--push \
		.
