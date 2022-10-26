#Docker file
FROM php:7.0-apache
COPY src/ /var/www/html
EXPOSE 80
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf