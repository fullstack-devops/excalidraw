FROM nginx:1.21-alpine

USER 0

ARG APP_VERSION
RUN echo -e "Nginx Version: $NGINX_VERSION\nApp Version: $APP_VERSION" > /VERSION

ADD ./nginx.conf /etc/nginx/nginx.conf
ADD ./default.conf /etc/nginx/conf.d/default.conf

WORKDIR /app

## add permissions for nginx user
RUN chown -R nginx:nginx /app && chmod -R 755 /app && \
        chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /var/log/nginx && \
        chown -R nginx:nginx /etc/nginx/conf.d
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid

USER nginx

ADD ./excalidraw/build /usr/share/nginx/html

CMD cat /VERSION && nginx -g 'daemon off;'