#Base image for apache2 server with php 8.2
FROM httpd:latest

#configure working directory
WORKDIR /var/www/html

#Update packages and installing required packages
RUN apt-get update && apt-get install apt-transport-https lsb-release ca-certificates wget -y
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg 
RUN sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'
RUN apt-get update

# Expand the curly with all the required extensions.
RUN apt-get install -y php8.2 php8.2-cli php8.2-bz2 php8.2-curl php8.2-mbstring php8.2-intl php8.2-mysql php8.2-xml

# integrate php with apache2
RUN apt-get install -y libapache2-mod-php8.2

#Multi Processing Module and load php modules
RUN sed -ri -e 's/LoadModule mpm_event_module/#LoadModule mpm_event_module/g' /usr/local/apache2/conf/httpd.conf \
    && sed -ri -e 's/#LoadModule mpm_prefork_module/LoadModule mpm_prefork_module/g' /usr/local/apache2/conf/httpd.conf \
    && sed -ri -e 's/#LoadModule deflate_module/LoadModule deflate_module/g' /usr/local/apache2/conf/httpd.conf \
    && sed -ri -e 's/#LoadModule rewrite_module/LoadModule rewrite_module/g' /usr/local/apache2/conf/httpd.conf \
    && sed -ri -e 's/#LoadModule expires_module/LoadModule expires_module/g' /usr/local/apache2/conf/httpd.conf \
    && echo 'LoadModule php_module /usr/lib/apache2/modules/libphp8.2.so' | tee -a /usr/local/apache2/conf/httpd.conf \
    && echo 'Include conf/extra/php.conf' | tee -a /usr/local/apache2/conf/httpd.conf

#Debian bashed distribution - Wont work directly to the httpd - can enable the modules by modifying the httpd.conf
RUN a2enmod headers rewrite

#Copying created custom configuration to apache configuration. 
COPY ./000-default.conf /etc/apache2/sites-enabled/000-default.conf

#Copying Created custom configuration to php configuration.
COPY ./php.conf /usr/local/apache2/conf/extra/php.conf

COPY . .

EXPOSE 80

#RUN service apache2 restart
#Start apache2 service in forground
CMD ["apache2ctl", "-D", "FOREGROUND"]