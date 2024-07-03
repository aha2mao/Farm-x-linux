FROM node:lts-alpine3.20

RUN node -e "console.log(process.platform, process.arch)"

ENV COREPACK_NPM_REGISTRY=https://registry.npmmirror.com

RUN corepack enable
RUN corepack prepare pnpm@8.15.5 --activate
RUN pnpm -v

COPY . /app
WORKDIR /app

RUN pnpm install
RUN find /app/node_modules/.pnpm -type d -name '@farmfe*'
RUN pnpm --filter="module1" build
