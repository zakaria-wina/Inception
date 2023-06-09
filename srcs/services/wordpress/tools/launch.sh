#!/bin/bash

cd /var/www/html

sed -i 's/\/run\/php\/php7.3-fpm.sock/wordpress:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

wp core download --path=/var/www/html --allow-root

wp config create --path=/var/www/html --allow-root \
    --dbname=$MARIADB_NAME \
    --dbuser=$MARIADB_USER \
    --dbpass=$MARIADB_PASS \
    --dbhost=$MARIADB_HOST

wp core install --path=/var/www/html --allow-root \
    --url=$WORDPRESS_URL \
    --title=$WORDPRESS_TITLE \
    --admin_user=$WORDPRESS_ADMIN_USER \
    --admin_password=$WORDPRESS_ADMIN_PASS \
    --admin_email=$WORDPRESS_ADMIN_EMAIL

wp user create --path=/var/www/html --allow-root \
    $WORDPRESS_USER $WORDPRESS_EMAIL \
    --user_pass=$WORDPRESS_PASS \
    --role=author

wp plugin install --path=/var/www/html --allow-root redis-cache --activate
wp config set FS_METHOD direct    --type=constant --path=/var/www/html --allow-root
wp config set WP_REDIS_HOST redis --type=constant --path=/var/www/html --allow-root
wp config set WP_REDIS_PORT 6379  --type=constant --path=/var/www/html --allow-root
wp config set WP_CACHE true       --type=constant --path=/var/www/html --allow-root
wp redis enable --path=/var/www/html --allow-root

chown -R www-data:www-data /var/www/html

php-fpm7.3 -F -R
