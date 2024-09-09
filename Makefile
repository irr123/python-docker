IMAGE=c1rno/python
VERSION=latest

.PHONY: build
build:
	docker buildx build \
		--platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
		--tag ${IMAGE}:${VERSION} \
		--load \
		.
