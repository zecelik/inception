#!/bin/bash

# NGINX başlatılıyor...
echo "NGINX başlatılıyor..."

# Klasör oluşturma ve izinleri ayarlama
mkdir -p /etc/nginx/conf.d
mkdir -p /etc/nginx/sites-enabled
mkdir -p /var/log/nginx
touch /var/log/nginx/access.log
touch /var/log/nginx/error.log

# Varsayılan site yapılandırması
echo "server {
    listen 80;
    server_name localhost;
    root /var/www/html;

    location / {
        index index.html index.htm index.php;
        try_files \$uri \$uri/ /index.php?\$args;
    }

    location ~ \.php$ {
        include fastcgi_params;
        fastcgi_pass wordpress:9000;
        fastcgi_index index.php;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        fastcgi_param PATH_INFO \$fastcgi_path_info;
    }

    location ~ /\.ht {
        deny all;
    }
}" > /etc/nginx/conf.d/default.conf

echo "NGINX başlatıldı."

# NGINX'i başlat
nginx -g "daemon off;"
