FROM nginx:1.13.9

RUN chmod -R 777 /var/cache/nginx /var/run /var/log/nginx /usr/share/nginx/html

RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf

## Copy our nginx config
COPY nginx/ /etc/nginx/conf.d/

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

## copy over the artifacts in dist folder to default nginx public folder
COPY dist/ /usr/share/nginx/html

EXPOSE 8080
