# Temel imaj olarak Debian Bullseye'yi kullan
FROM debian:bullseye

# Çalışma dizinini belirle
WORKDIR /root

# Sistem paketlerini güncelle ve gerekli paketleri kur
RUN apt-get update && \
    apt-get install -y \
        mariadb-server \
        && rm -rf /var/lib/apt/lists/*

# MariaDB'nin standart portunu dışa aç
EXPOSE 3306

# Konfigürasyon dosyalarını ve başlangıç betiğini kopyala
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/dbstart.sh /usr/local/bin/dbstart.sh

# Başlangıç betiğine çalıştırma izni ver
RUN chmod +x /usr/local/bin/dbstart.sh

# MariaDB'nin başlangıç komutunu ayarla
ENTRYPOINT [ "/usr/local/bin/dbstart.sh" ]
CMD [ "mariadbd" ]

