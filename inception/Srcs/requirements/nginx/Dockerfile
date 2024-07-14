# NGINX Dockerfile

FROM nginx:stable-alpine

# Copy default.conf to conf.d folder
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy nxstart.sh script and make it executable
COPY tools/nxstart.sh /usr/local/bin/nxstart.sh
RUN chmod +x /usr/local/bin/nxstart.sh

# Expose ports
EXPOSE 80 443

# Run nxstart.sh script during container startup
CMD ["/usr/local/bin/nxstart.sh"]
