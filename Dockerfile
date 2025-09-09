FROM python:3.10-slim

RUN pip install --no-cache-dir playwright && \
    playwright install chromium && \
    apt-get update && apt-get install -y \
    libglib-2.0.so.0 libgobject-2.0.so.0 libnspr4.so libnss3.so libnssutil3.so libsmime3.so libgio-2.0.so.0 libdbus-1.so.3 libatk-1.0.so.0 libatk-bridge-2.0.so.0 libcups.so.2 libexpat.so.1 libxcb.so.1 libxkbcommon.so.0 libatspi.so.0 libX11.so.6  libXcomposite.so.1 libXdamage.so.1 libXext.so.6 libXfixes.so.3 libXrandr.so.2 libgbm.so.1 libcairo.so.2 libpango-1.0.so.0 libasound.so.2 && \
    rm -rf /var/lib/apt/lists/*
