FROM python:3.10-slim

RUN pip install --no-cache-dir playwright && \
    playwright install --with-deps chromium && \
    rm -rf /var/lib/apt/lists/*
