FROM python:3.10-slim

RUN pip install --no-cache-dir playwright && \
    playwright install chromium && \
    apt-get update && apt-get install -y \
    libglib2.0-0 libgobject2.0-0 libnspr4 libnss3 libnssutil3 libsmime3 \
    libdbus-glib-1-0 libdbus-1-3 libatk1.0-0 libatk-bridge-2.0-0 \
    libcups2 libexpat1 libxcb1 libxkbcommon0 libatspi2.0-0 \
    libx11-6 libxcomposite1 libxdamage1 libxext6 libxfixes3 \
    libxrandr2 libgbm1 libcairo2 libpango1.0-0 libasound2
    && rm -rf /var/lib/apt/lists/*
