# 构建阶段 - 使用官方Playwright基础镜像
FROM mcr.microsoft.com/playwright/python:v1.40.0-jammy AS builder

WORKDIR /app
RUN pip install --user playwright==1.40.0

# 运行阶段 - 基于Alpine的最小化镜像
FROM python:3.10-alpine
WORKDIR /app

# 复制Python依赖和Playwright浏览器
COPY --from=builder /root/.local /root/.local
COPY --from=builder /ms-playwright /ms-playwright

# 安装运行时依赖
RUN apk add --no-cache \
    libgcc \
    libstdc++ \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ttf-freefont

ENV PATH="/root/.local/bin:$PATH"
ENV PLAYWRIGHT_BROWSERS_PATH="/ms-playwright"

# 创建非root用户
RUN addgroup -S playwright && \
    adduser -S -G playwright playwright && \
    chown -R playwright:playwright /app
USER playwright

CMD ["python", "/app/main.py"]
