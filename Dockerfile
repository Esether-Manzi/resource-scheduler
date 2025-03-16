# Use official PHP 8.2 Apache image
FROM php:8.2-apache

# Set the working directory
WORKDIR /var/www/html

# Copy project files into the container
COPY . /var/www/html/

# Enable Apache mod_rewrite (if needed)
RUN a2enmod rewrite

# Set proper permissions
RUN chown -R www-data:www-data /var/www/html

# Expose port 80 for web traffic
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]

RUN apt-get update && apt-get install -y libmariadb-dev

RUN docker-php-ext-install mysqli