FROM ubuntu

RUN apt-get update
RUN apt-get install -y nginx curl zip

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
RUN curl -o /var/www/html/game.zip -L https://github.com/sksuraj17/play-2048/archive/refs/heads/master.zip
RUN cd /var/www/html/ && unzip game.zip && mv play-2048-master/* . && rm -rf game.zip play-2048-master

EXPOSE 80

CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]