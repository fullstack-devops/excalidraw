# https://catalog.redhat.com/software/containers/ubi9/nginx-120/61a609f2bfd4a5234d596287
FROM registry.access.redhat.com/ubi9/nginx-120@sha256:6e091d47bb5d0fe2a3326d30542c348b39f8db3a644acb7ff63f10e997f2a059

USER root
ARG APP_VERSION
RUN echo -e "Nginx Version: $NGINX_VERSION\nApp Version: $APP_VERSION" > /VERSION
USER default

ADD ./excalidraw/build /tmp/src
RUN /usr/libexec/s2i/assemble

CMD cat /VERSION && /usr/libexec/s2i/run
