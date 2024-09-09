# Python builder image

Simple image with [uv](https://github.com/astral-sh/uv) package manager.

Available at [docker-hub](https://hub.docker.com/repository/docker/c1rno/python).

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
