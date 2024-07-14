#!/bin/bash

# Ayarlar
DOMAIN_NAME="login.42.fr"
TITLE="My WordPress Site"
WORDPRESS_ADMIN_NAME="adminuser"
WORDPRESS_ADMIN_PASSWORD="adminpassword"
WORDPRESS_ADMIN_EMAIL="admin@example.com"

# Klasör ve dosya izinlerini ve sahipliğini ayarla
chown -R www-data: /var/www/*
chmod -R 755 /var/www/*
mkdir -p /run/php/
touch /run/php/php7.4-fpm.pid

# WordPress kurulumunu kontrol et ve yap
if [ ! -f /var/www/html/wp-config.php ]; then
    mkdir -p /var/www/html
    cd /var/www/html

    # WordPress çekirdeğini indir
    wp core download --allow-root --path=/var/www/html

    # WordPress yapılandırma dosyasını oluştur
    wp config create --allow-root \
        --dbname=$WORDPRESS_DB_NAME \
        --dbuser=$WORDPRESS_DB_USER \
        --dbpass=$WORDPRESS_DB_PASSWORD \
        --dbhost=mariadb \
        --path=/var/www/html

    # WordPress kurulumunu başlat
    echo "WordPress kurulumu başlatılıyor..."

    wp core install --allow-root \
        --url=http://$DOMAIN_NAME \
        --title="$TITLE" \
        --admin_user=$WORDPRESS_ADMIN_NAME \
        --admin_password=$WORDPRESS_ADMIN_PASSWORD \
        --admin_email=$WORDPRESS_ADMIN_EMAIL \
        --path=/var/www/html

    # WordPress yönetici kullanıcısını oluştur
    wp user create --allow-root \
        $WORDPRESS_ADMIN_NAME $WORDPRESS_ADMIN_EMAIL \
        --user_pass=$WORDPRESS_ADMIN_PASSWORD \
        --path=/var/www/html
fi

echo "Tarayıcınızda $DOMAIN_NAME adresini ziyaret edebilirsiniz."

# Diğer komutları çalıştır
exec "$@"
