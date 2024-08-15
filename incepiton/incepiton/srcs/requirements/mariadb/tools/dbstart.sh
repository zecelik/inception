#!/bin/bash



echo "Starting MariaDB service..."
service mariadb start


sleep 5

DB_NAME="${MYSQL_DATABASE_NAME:-default_db}"
DB_USER="${MYSQL_USER:-default_user}"
DB_PASS="${MYSQL_PASSWORD:-default_password}"



echo "Creating database, user, and granting privileges..."  
mysql -u root -e "CREATE DATABASE IF NOT EXISTS \`$DB_NAME\`;"       
mysql -u root -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS';"  
mysql -u root -e "GRANT ALL PRIVILEGES ON \`$DB_NAME\`.* TO '$DB_USER'@'%';" 
mysql -u root -e "FLUSH PRIVILEGES;"   





echo "Shutting down MariaDB..."
mysqladmin -u root shutdown  

exec "$@"  

