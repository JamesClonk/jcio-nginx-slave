FROM nginx

COPY default.conf /etc/nginx/conf.d/default.conf
COPY frontend.conf /etc/nginx/conf.d/frontend.conf
COPY backend.conf /etc/nginx/conf.d/backend.conf
COPY rqlite.conf /etc/nginx/conf.d/rqlite.conf
RUN rm -f /etc/nginx/conf.d/example_ssl.conf

RUN mkdir /etc/nginx/ssl
RUN chmod 700 /etc/nginx/ssl
COPY server-cert.pem /etc/nginx/ssl/nginx.pem
COPY server-key.pem /etc/nginx/ssl/nginx.key
RUN chmod 400 /etc/nginx/ssl/nginx.pem
RUN chmod 400 /etc/nginx/ssl/nginx.key
