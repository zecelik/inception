FROM debian:bullseye    


RUN apt-get update && \                      
    apt-get install -y \                         
        mariadb-server \                        
        && rm -rf /var/lib/apt/lists/*           



COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/     
COPY ./tools/dbstart.sh /usr/local/bin/dbstart.sh      


WORKDIR /root    



EXPOSE 3306           


RUN chmod +x /usr/local/bin/dbstart.sh     


ENTRYPOINT [ "/usr/local/bin/dbstart.sh" ]  
CMD [ "mariadbd" ]       
