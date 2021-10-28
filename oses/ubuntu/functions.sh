installMariadb()
{
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

installMongodb()
{
  wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -
  echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
  sudo apt update && sudo apt -y upgrade
  sudo apt-get install -y mongodb-org
  sudo systemctl restart mongod
}

installPhp()
{
  sudo add-apt-repository ppa:ondrej/php
  sudo apt update && sudo apt upgrade -y
  sudo apt install -y php-dev
  sudo apt -y install php-cli php-mbstring php-pecl-http php-uploadprogress \
    php8.0-cli php8.0-curl php8.0-dev php8.0-http php8.0-igbinary php8.0-intl php8.0-mbstring php8.0-mcrypt php8.0-pcov php8.0-raphf php8.0-xml php8.0-xmlrpc php8.0-xsl php8.0-yaml php8.0-zip
  sudo apt -y install php-imagick php-gd php8.0-gd php8.0-imagick imagemagick
  sudo apt -y install php8.0-opcache php8.0-memcache php8.0-memcached php8.0-apcu
  sudo apt -y install php8.0-mongodb php8.0-mysql php8.0-redis php8.0-sqlite3
  sudo apt -y install php8.0-soap php8.0-oauth
}

installComposer()
{
  curl -sS https://getcomposer.org/installer -o composer-setup.php
  sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
}

installCaching()
{
  sudo apt -y install redis-server memcached
}

installNginx()
{
  sudo apt -y remove apache2
  sudo apt -y install nginx
  sudo apt -y install php8.0-fpm
}

installNodejs()
{
  curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
  sudo apt-get install -y nodejs

  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt update && sudo apt install -y yarn
}

installSupervisor()
{
  sudo apt -y install supervisor
}

installDocker()
{
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

  sudo apt-get install docker-ce docker-ce-cli containerd.io

  sudo usermod -aG docker $USER
}

installWebmin()
{
  wget http://prdownloads.sourceforge.net/webadmin/webmin_1.981_all.deb
  sudo dpkg --install webmin_1.981_all.deb
}

installPihole()
{
  curl -sSL https://install.pi-hole.net | bash
}
