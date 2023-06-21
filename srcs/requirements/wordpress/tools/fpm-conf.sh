#!bin/sh
    
if [ ! -f "/etc/php8/php-fpm.d/www.conf" ]; then
cat << EOF > /etc/php8/php-fpm.d/www.conf
[www]
user = $PHPUSER
group = $PHPUSER
listen = $WPORT
listen.owner = $PHPUSER
listen.group = $PHPUSER
pm = dynamic
pm.max_children = 5
pm.start_servers = 2
pm.min_spare_servers = 1
pm.max_spare_servers = 3
EOF
fi