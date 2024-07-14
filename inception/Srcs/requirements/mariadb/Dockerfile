# Mariadb Dockerfile

FROM mariadb:latest

# Copy 50-server.cnf to mariadb conf.d folder
COPY 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copy dbstart.sh script and make it executable
COPY tools/dbstart.sh /usr/local/bin/dbstart.sh
RUN chmod +x /usr/local/bin/dbstart.sh

# Expose ports
EXPOSE 3306

# Run dbstart.sh script during container startup
CMD ["/usr/local/bin/dbstart.sh"]
