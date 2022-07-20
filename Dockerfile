FROM node:14 AS build

WORKDIR /opt/node_app

ARG EXCALIDRAW_VERSION="0.12.0"

RUN git clone --depth 1 --branch v${EXCALIDRAW_VERSION} https://github.com/excalidraw/excalidraw ./

RUN yarn --ignore-optional

ARG NODE_ENV=production
RUN yarn build:app:docker

FROM nginxinc/nginx-unprivileged:1.23.1-alpine

COPY --from=build /opt/node_app/build /usr/share/nginx/html

HEALTHCHECK CMD wget -q -O /dev/null http://localhost:8080 || exit 1