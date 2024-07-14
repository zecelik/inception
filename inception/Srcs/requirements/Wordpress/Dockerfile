# WordPress + php-fpm Dockerfile

FROM wordpress:php7.4-fpm

# Install necessary PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy custom www.conf
COPY www.conf /usr/local/etc/php-fpm.d/www.conf

# Copy wp.sh script and make it executable
COPY wp.sh /usr/local/bin/wp.sh
RUN chmod +x /usr/local/bin/wp.sh

# Run wp.sh script during container startup
CMD ["/usr/local/bin/wp.sh"]
