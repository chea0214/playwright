# 运行阶段 - 基于Alpine的最小化镜像
FROM python:3.10-alpine

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
