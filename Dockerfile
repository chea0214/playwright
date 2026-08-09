FROM python:3.12-slim

RUN pip install --no-cache-dir playwright requests && \
    playwright install --with-deps firefox && \
    rm -rf /var/lib/apt/lists/*
