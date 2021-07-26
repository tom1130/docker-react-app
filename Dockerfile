FROM node:alpine as builder

WORKDIR /usr/src/app

COPY package.json ./

RUN npm install

COPY ./ ./

RUN npm run build

FROM nginx
# 뒤 경로에 있어야 nginx가 알아서 제공할 수 있음
# nginx의 기본 포트는 80
COPY --from=builder /usr/src/app/build /usr/share/nginx/html