#Base image from ECR repository for docker build. 
FROM 455415553703.dkr.ecr.us-west-2.amazonaws.com/laravel-base-image-aug14:latest
#configure working directory
WORKDIR /var/www/html
#Copy laravel application to the container
COPY ./ /var/www/html/
#Install Composer for php Dependencies
RUN composer install --no-dev --optimize-autoloader
#Change the ownership
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache
#Base image not having to expose port we need to expose here.
#EXPOSE 80
#Restart apache2 servie in foreground - Keep the container alive as long as apache2 running.
CMD ["apache2ctl", "-D", "FOREGROUND"]
