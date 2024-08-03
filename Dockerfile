#Official PHP 8.2 Apache image as the base image - "Pre-configured environment for running PHP applications with the Apache HTTP Server"
FROM php:8.2-apache

#Install Dependencies - "sed to update the package lists for the APT package manager and install specific packages necessary for the container environment"
RUN apt-get update && \
    apt-get install -y libxml2-dev libsqlite3-dev libzip-dev zip wget && \
    docker-php-ext-install xmlwriter pdo_sqlite zip    

#Enable Mod_Rewrite - "Read write URL" - "Translate human readable path in to code friendly"
RUN a2enmod rewrite

#Set environment variable for the custom Apache document root
ENV APACHE_DOCUMENT_ROOT=/var/www/html/public

# Tweak and Update Apache Configuration - Use sed to replace the default document root with the custom one
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

# Copy application code from current directory in to Custom root directory
COPY . /var/www/html

#Working directory
WORKDIR /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]

#Install the wget utility within a Docker container.
RUN apt-get install -y wget

#Download and Install composer - Composer is used to manage dependencies for PHP projects, ensuring that the right versions of libraries are installed.
#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN wget https://getcomposer.org/composer.phar

#Make Composer Executable
RUN chmod +x ./composer.phar 

#Move Composer to /usr/bin/ and rename as composer
RUN mv ./composer.phar /usr/bin/composer

#Install dependencies for project
RUN composer install

# Change permissions and ownership
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
RUN chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

#Change Permission
#RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
#RUN chmod -R 777 /var/www/html/storage/

#Ensure the SQLite Database File Exists
#RUN ls -l /home/mahendrakumar-v/Public/Project/Laravel-App/database/database.sqlite
#RUN chmod 777 /home/mahendrakumar-v/Public/Project/Laravel-App/database/database.sqlite

#Verify the Database Configuration - "Ensure that the path to the SQLite database file is correctly specified in your Laravel .env file"
#RUN nano /home/mahendrakumar-v/Public/Project/Laravel-App/.env
