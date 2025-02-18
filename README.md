# Python builder image

Read it first: https://bogomolov.work/blog/posts/docker-uv/

---

Simple image with [uv](https://github.com/astral-sh/uv) package manager.

Available at [docker-hub](https://hub.docker.com/repository/docker/c1rno/python).

## History

1. `BASE_IMAGE=python:3.13.2-slim-bookworm VERSION=v1.0.4 make build`
1. `BASE_IMAGE=python:3.13.1-slim-bookworm VERSION=v1.0.3 make build`
1. `BASE_IMAGE=python:3.13.0-slim-bookworm VERSION=v1.0.2 make build`
1. `BASE_IMAGE=python:3.12.7-slim-bookworm VERSION=v1.0.1 make build`
1. `BASE_IMAGE=python:3.12.5-slim-bookworm VERSION=v1.0.0 make build`

## How to

```shell
make && VERSION=v1.0.1 make
```

## Multistage example

```shell
FROM c1rno/python:v1.0.0 AS builder

COPY ./requirements.txt requirements.txt
RUN uv pip install -r requirements.txt

FROM python:3.12.5-slim-bookworm

ENV PYTHONUNBUFFERED=1
ENV PATH=/opt/venv/bin:$PATH

COPY --from=builder /opt/venv /opt/venv

COPY . /opt/app
WORKDIR /opt/app
```
