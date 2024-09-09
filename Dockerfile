ARG BASE_IMAGE=python:3.12.5-slim-bookworm

FROM $BASE_IMAGE AS builder

ENV PYTHONUNBUFFERED=1
ENV PATH=/root/.cargo/bin:/opt/venv/bin:$PATH

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-dev \
    pkg-config \
    && rm -rf /var/lib/apt/lists/*

RUN pip install uv && uv venv /opt/venv
