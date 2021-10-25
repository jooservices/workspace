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
