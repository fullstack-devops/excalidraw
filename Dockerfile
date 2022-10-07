# https://catalog.redhat.com/software/containers/ubi9/nginx-120/61a609f2bfd4a5234d596287
FROM registry.access.redhat.com/ubi9/nginx-120@sha256:6e091d47bb5d0fe2a3326d30542c348b39f8db3a644acb7ff63f10e997f2a059

ADD ./excalidraw/build /tmp/src
# ADD ./excalidraw/build /usr/share/nginx/html
RUN /usr/libexec/s2i/assemble
CMD /usr/libexec/s2i/run