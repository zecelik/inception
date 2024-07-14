#!/bin/bash

# Mariadb başlatılıyor...
echo "Mariadb başlatılıyor..."

# Klasör oluşturma ve izinleri ayarlama
mkdir -p /var/lib/mysql
mkdir -p /var/log/mysql
touch /var/log/mysql/error.log

# Mariadb servisini başlat
/usr/bin/mysqld_safe --datadir='/var/lib/mysql' --socket='/var/run/mysqld/mysqld.sock' --pid-file='/var/run/mysqld/mysqld.pid' --basedir='/usr' --log-error='/var/log/mysql/error.log' &

# Başlatma işlemi tamamlandığında bir süre bekleyin
sleep 5

# Mariadb root kullanıcısının parolasını ayarlayın
if [ ! -f /var/lib/mysql/.mariadb_password_set ]; then
    echo "Setting MariaDB root password..."
    mysqladmin -u root password "$MYSQL_ROOT_PASSWORD"

    # İlk başlatmada bir defaya mahsus yapılacak işaret
    touch /var/lib/mysql/.mariadb_password_set
fi

echo "Mariadb başlatıldı."

# Diğer komutları çalıştır
exec "$@"
