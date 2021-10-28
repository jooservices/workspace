info "Update"
sudo apt update && sudo apt -y upgrade && sudo apt autoremove && sudo apt clean all

info "Software properties common"
sudo apt -y install software-properties-common

info "Required packages"
sudo apt -y install curl git unzip perl libnet-ssleay-perl openssl libauthen-pam-perl libpam-runtime libio-pty-perl apt-show-versions python curl openssh-server
sudo apt -y install \
  ca-certificates \
  gnupg \
  lsb-release

sudo apt install build-essential gcc g++ make flex bison openssl libssl-dev perl perl-base perl-modules libperl-dev \
  libperl4-corelibs-perl libwww-perl libaio1 libaio-dev gifsicle webp libde265-dev \
  zlib1g zlib1g-dev libcap-dev cron bzip2 zip automake autoconf libtool cmake python libdb-dev libsasl2-dev \
  libncurses5 libncurses5-dev libsystemd-dev bind9 dnsutils quota patch logrotate rsyslog libc6-dev libexpat1-dev \
  libcrypt-openssl-rsa-perl libnuma-dev libnuma1 git dos2unix ipcalc unzip net-tools wget apache2-utils grc \
  libjpeg-dev libpng-dev libtiff-dev libgif-dev libwebp-dev imagemagick libpcre3 libpcre3-dev uuid-dev \
  gnupg2 ca-certificates lsb-release apache2-dev libxml2-dev libcurl4-openssl-dev liblmdb-dev libgeoip-dev pkgconf \
  libpcre++-dev libyajl-dev apt-utils htop nano bc libmaxminddb-dev -y

if [[ ${RAM_TOTAL} -lt ${LOW_RAM} ]]; then
    printf "${RED}%s${NC}\n" "${MINIMUM_RAM_REQUIRED}"
    printf "${RED}%s${NC}\n" "${EXITING}"
    exit
fi

promptInstall "Mariadb" installMariadb
promptInstall "Mongodb" installMongodb
promptInstall "PHP" installPhp
promptInstall "Composer" installComposer
promptInstall "Nginx" installNginx
promptInstall "Nodejs" installNodejs
promptInstall "Supervisor" installSupervisor
promptInstall "Docker" installDocker
promptInstall "Webmin" installWebmin
promptInstall "Pihole" installPihole
