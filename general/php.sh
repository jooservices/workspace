if [ "$OS_TYPE" = "armv7l" ]; then
  sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
  echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/php.list
else
  echo Ubuntu
  sudo add-apt-repository ppa:ondrej/php
fi

sudo apt update && sudo apt upgrade
sudo apt install -y php-dev
sudo apt -y install php-imagick php-gd php-cli php-mbstring php-pecl-http php-uploadprogress imagemagick \
  php8.0-apcu php8.0-cli php8.0-curl php8.0-dev php8.0-gd php8.0-http php8.0-igbinary php8.0-imagick php8.0-intl php8.0-mbstring php8.0-mcrypt php8.0-oauth php8.0-pcov php8.0-raphf php8.0-soap php8.0-xml php8.0-xmlrpc php8.0-xsl php8.0-yaml php8.0-zip
sudo apt -y install php8.0-opcache php8.0-memcache php8.0-memcached
sudo apt -y install php8.0-mongodb php8.0-mysql php8.0-redis php8.0-sqlite3

if [ "$OS_TYPE" = "armv7l" ]; then
  read -p "Install PHP Redis extension : " confirm
  if [ $confirm = "y" ]; then
    sudo pecl install redis
  fi

  read -p "Install PHP PCov extension : " confirm
  if [ $confirm = "y" ]; then
    sudo pecl install pcov
  fi
fi
