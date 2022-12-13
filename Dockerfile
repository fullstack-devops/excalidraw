FROM excalidraw/excalidraw:latest

COPY .nginx/nginx.conf /etc/nginx/nginx.conf
COPY .nginx/default.conf /etc/nginx/conf.d/default.conf

## add permissions for nginx user
RUN chown -R nginx:nginx /usr/share/nginx/html && chmod -R 755 /usr/share/nginx/html && \
        chown -R nginx:nginx /var/cache/nginx && \
        chown -R nginx:nginx /var/log/nginx && \
        chown -R nginx:nginx /etc/nginx/conf.d
RUN touch /var/run/nginx.pid && \
        chown -R nginx:nginx /var/run/nginx.pid

USER nginx

CMD nginx -g 'daemon off;'