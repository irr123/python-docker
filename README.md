# Python builder image

Simple image with [uv](https://github.com/astral-sh/uv) package manager.

## Multistage example

```shell
FROM c1rno/python AS builder

COPY ./requirements.txt requirements.txt
RUN uv pip install -r requirements.txt

FROM python:3.12.5-slim-bookworm

ENV PYTHONUNBUFFERED=1
ENV PATH=/opt/venv/bin:$PATH

COPY --from=builder /opt/venv /opt/venv

COPY . /opt/app
WORKDIR /opt/app
```
