#!/bin/bash

wp core download --allow-root --path=/var/www/html

sed -i 's/\/run\/php\/php7.3-fpm.sock/9000/g' /etc/php/7.3/fpm/pool.d/www.conf

wp config create --allow-root --path=/var/www/html \
                --dbname=$MARIADB_NAME \
                --dbuser=$MARIADB_USER \
                --dbpass=$MARIADB_PASS \
                --dbhost=mariadb

wp core install --allow-root --path=/var/www/html \
                --url=$WORDPRESS_URL \
                --title=$WORDPRESS_TITLE \
                --admin_user=$WORDPRESS_ADMIN_USER \
                --admin_password=$WORDPRESS_ADMIN_PASS \
                --admin_email=$WORDPRESS_ADMIN_EMAIL

wp user create --allow-root --path=/var/www/html \
                $WORDPRESS_USER $WORDPRESS_EMAIL \
                --user_pass=$WORDPRESS_PASS \
                --role=author

wp plugin install --allow-root --path=/var/www/html redis-cache --activate
wp config set --allow-root --path=/var/www/html WP_REDIS_HOST redis
wp config set --allow-root --path=/var/www/html WP_REDIS_PORT 6379
wp config set --allow-root --path=/var/www/html WP_CACHE true
wp redis enable --allow-root --path=/var/www/html

php-fpm7.3 -R -F
