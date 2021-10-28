installMariadb() {
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
}

installMongodb() {
  sudo apt install -y mongodb
  sudo systemctl enable mongodb
  sudo systemctl start mongodb
}

installPhp() {
  sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
  echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list

  sudo apt update && sudo apt upgrade -y
  sudo apt install -y php-dev
  sudo apt -y install php-cli php-mbstring php-pecl-http php-uploadprogress \
    php8.0-cli php8.0-curl php8.0-dev php8.0-http php8.0-igbinary php8.0-intl php8.0-mbstring php8.0-mcrypt php8.0-pcov php8.0-raphf php8.0-xml php8.0-xmlrpc php8.0-xsl php8.0-yaml php8.0-zip
  sudo apt -y install php-imagick php-gd php8.0-gd php8.0-imagick imagemagick
  sudo apt -y install php8.0-opcache php8.0-memcache php8.0-memcached php8.0-apcu
  sudo apt -y install php8.0-mongodb php8.0-mysql php8.0-redis php8.0-sqlite3
  sudo apt -y install php8.0-soap php8.0-oauth

  read -p "Install PHP Redis extension: " confirm
  if [ $confirm = "y" ]; then
    sudo pecl install redis
  fi

  read -p "Install PHP Pcov extension: " confirm
  if [ $confirm = "y" ]; then
    sudo pecl install pcov
  fi
}

installComposer() {
  curl -sS https://getcomposer.org/installer -o composer-setup.php
  sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
}

installCaching() {
  sudo apt -y install redis-server memcached
}

installNginx() {
  sudo apt -y remove apache2
  sudo apt -y install nginx
  sudo apt -y install php8.0-fpm
}

installNodejs() {
  alert "Will not install on Raspbian"
}

installSupervisor() {
  sudo apt -y install supervisor
}

installDocker() {
  curl -fsSL https://get.docker.com -o get-docker.sh
  sudo sh get-docker.sh

  sudo usermod -aG docker $USER
}

installWebmin() {
  wget http://prdownloads.sourceforge.net/webadmin/webmin_1.981_all.deb
  sudo dpkg --install webmin_1.981_all.deb
}
