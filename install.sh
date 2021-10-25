#!/bin/bash

# Variables
OS_TYPE=""

case $(uname -m) in
    i386)   OS_TYPE="386" ;;
    i686)   OS_TYPE="386" ;;
    x86_64) OS_TYPE="amd64" ;;
    arm)    dpkg --print-architecture | grep -q "arm64" && OS_TYPE="arm64" || OS_TYPE="arm" ;;
    armv7l) OS_TYPE="armv7l"
esac

echo "$OS_TYPE";

echo "Update"
sudo apt update && sudo apt -y upgrade

echo "Software properties common"
sudo apt -y install software-properties-common

echo "Basic packages"
sudo apt -y install curl git unzip perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python curl openssh-server
sudo apt -y install \
    ca-certificates \
    gnupg \
    lsb-release

echo "Mariadb"
sudo apt -y install mariadb-server

echo "Install PHP"
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

echo "Install Nginx"
sudo apt -y remove apache2
sudo apt -y install nginx
sudo apt -y install php8.0-fpm

echo "Install Caching"
sudo apt -y install redis-server memcached

echo "Install Composer"
curl -sS https://getcomposer.org/installer -o composer-setup.php
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer

echo "Install Supervisor"
sudo apt -y install supervisor

echo "Install Docker"

if [ "$OS_TYPE" = "armv7l" ]; then
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
else
    echo Ubuntu
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    sudo apt-get install docker-ce docker-ce-cli containerd.io

fi
sudo usermod -aG docker $USER
