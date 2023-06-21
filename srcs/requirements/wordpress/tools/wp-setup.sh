#!/bin/sh

wp --allow-root --path=/var/www core install --url="ahassan.42.fr" \
   --title="Inception WP" --admin_user=$DB_USER --admin_password=$DB_PASS --admin_email="${ADMIN_EMAIL}"

wp user create $WP_NAME "${AUTHOR_EMAIL}" --role=author --user_pass=$WP_PASS 

/usr/sbin/php-fpm8 -F