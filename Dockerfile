FROM nginx:1.13.9

RUN sed -i.bak 's/^user/#user/' /etc/nginx/nginx.conf
RUN chmod -R 777 /var/log/nginx;
RUN mkdir /var/cache/nginx/client_temp
RUN chmod -R 777 /var/cache/nginx/client_temp;

## Copy our nginx config
COPY nginx/ /etc/nginx/conf.d/

## Remove default nginx website
RUN rm -rf /usr/share/nginx/html/*

## copy over the artifacts in dist folder to default nginx public folder
COPY dist/ /usr/share/nginx/html

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
