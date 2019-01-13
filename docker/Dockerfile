FROM nginx:alpine

RUN mkdir /etc/ssl/{certs,private}
COPY files/default.conf /etc/nginx/conf.d/
COPY files/nginx.conf /etc/nginx/
COPY files/app.crt /etc/ssl/certs/
COPY files/app.key /etc/ssl/private/
