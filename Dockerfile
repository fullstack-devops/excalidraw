# https://catalog.redhat.com/software/containers/ubi9/nginx-120/61a609f2bfd4a5234d596287
FROM registry.access.redhat.com/ubi9/nginx-120:latest

USER 0
ARG APP_VERSION
RUN echo -e "Nginx Version: $NGINX_VERSION\nApp Version: $APP_VERSION" > /VERSION

ADD ./excalidraw/build /tmp/src/
RUN chown -R 1001:0 /tmp/src
USER 1001

# Let the assemble script to install the dependencies
RUN /usr/libexec/s2i/assemble

# Run script uses standard ways to run the application
CMD /usr/libexec/s2i/run
