#!/bin/sh

wp --allow-root --path=/var/www core install --url="ahassan.42.fr" \
   --title="Inception WP" --admin_user=$DB_USER --admin_password=$DB_PASS --admin_email="ahassan@42.fr"

wp user create $WP_NAME $WP_USER --role=author --user_pass=$WP_PASS --allow-root

/usr/sbin/php-fpm8 -F