
FROM debian:bullseye


WORKDIR /root


RUN apt-get update && \
    apt-get install -y \
        nginx \
        openssl \
    && rm -rf /var/lib/apt/lists/*


COPY ./conf/default /etc/nginx/sites-available/default    
COPY ./tools/nxstart.sh /usr/local/bin/nxstart.sh      


RUN chmod +x /usr/local/bin/nxstart.sh


EXPOSE 443


ENTRYPOINT [ "/usr/local/bin/nxstart.sh" ]
CMD ["nginx", "-g", "daemon off;"]
