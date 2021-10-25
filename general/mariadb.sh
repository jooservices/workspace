sudo apt -y install mariadb-server
sudo /etc/init.d/mysql restart
echo "Setup MariaDb"
sudo mysql_secure_installation
echo "Use below script for switching to mysql_native_password"
echo "USE mysql;
UPDATE user SET plugin='mysql_native_password' WHERE User='root';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
FLUSH PRIVILEGES;
exit;"
sudo mysql -uroot -p
