FROM python:3.10-slim

RUN pip install --no-cache-dir playwright && \
    playwright install chromium && \
    apk add --no-cache \
    libgcc \
    libstdc++ \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ttf-freefont
