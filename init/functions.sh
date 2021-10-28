alert()
{
  printf "${RED}$1${NC}\n"
}

info()
{
  printf "${GREEN}$1${NC}\n"
}

infoWith()
{
  printf "${NC}$1: ${GREEN}$2${NC}\n"
}

email() {
    clear
    while true; do
        read -r -p "Enter your email: " ADMIN_EMAIL
        echo
        if [[ "${ADMIN_EMAIL}" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]]; then
            infoWith "Your email:" "${ADMIN_EMAIL}."
            ssh-keygen -t ed25519 -C "${ADMIN_EMAIL}"
            break
        else
            alert "Invalid email."
        fi
    done
}

promptInstall(){
  while true; do
      read -p "Install ${GREEN}$1${NC}: " yn
      case $yn in
          [Yy]* ) infoWith "Installing" $1 $2;;
          [Nn]* ) exit;;
          * ) echo "Please answer yes or no.";;
      esac
  done
}

isInstalled()
{
  IS_INSTALLED=false

  if [ -x "$(command -v $1)" ]
  then
      IS_INSTALLED=true;
  fi

  return $IS_INSTALLED
}
