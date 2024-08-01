# Temel imaj olarak Debian Bullseye'yi kullan
FROM debian:bullseye

# Çalışma dizinini belirle
WORKDIR /root

# Sistem paketlerini güncelle ve gerekli paketleri kur
RUN apt-get update && \
    apt-get install -y \
        nginx \
        openssl \
    && rm -rf /var/lib/apt/lists/*

# Nginx yapılandırma dosyalarını ve başlangıç betiğini kopyala
COPY ./conf/default /etc/nginx/sites-available/default
COPY ./tools/nxstart.sh /usr/local/bin/nxstart.sh

# Başlangıç betiğine çalıştırma izni ver
RUN chmod +x /usr/local/bin/nxstart.sh

# Portları dışa aç
EXPOSE 443

# Nginx başlangıç komutlarını ayarla
ENTRYPOINT [ "/usr/local/bin/nxstart.sh" ]
CMD ["nginx", "-g", "daemon off;"]

