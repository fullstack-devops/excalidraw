# https://catalog.redhat.com/software/containers/ubi9/nginx-120/61a609f2bfd4a5234d596287
FROM registry.access.redhat.com/ubi9/nginx-120:latest

USER root
ARG APP_VERSION
RUN echo -e "Nginx Version: $NGINX_VERSION\nApp Version: $APP_VERSION" > /VERSION

USER default

ADD ./excalidraw/build /tmp/src
RUN /usr/libexec/s2i/assemble

CMD cat /VERSION && /usr/libexec/s2i/run
