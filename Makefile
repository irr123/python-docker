IMAGE_NAME=c1rno/python:v1.0.0

.PHONY: build
build:
	docker buildx build \
		--platform linux/arm/v7,linux/arm64/v8,linux/amd64 \
		--tag ${IMAGE_NAME} \
		--push \
		.
