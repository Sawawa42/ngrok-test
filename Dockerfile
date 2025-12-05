FROM node:20-alpine

WORKDIR /app

# pnpmをインストール
RUN corepack enable && corepack prepare pnpm@latest --activate

# 依存関係をインストール
COPY package.json pnpm-lock.yaml ./
RUN pnpm install

# ソースコードをコピー
COPY . .

# ポート3000を公開
EXPOSE 3000

# アプリケーションを起動
CMD ["pnpm", "dev"]
