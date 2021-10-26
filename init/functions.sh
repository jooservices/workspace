alert()
{
  printf "${RED}%s${NC}\n" $1
}

info()
{
  printf "${GREEN}%s${NC}\n" $1
}

infoWith()
{
  printf "${NC}%s ${GREEN}%s${NC}\n" $1 $2
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

funcPromptInstall(){
  read -p "Install ${GREEN}$1${NC}: " confirm
  if [ $confirm = "y" ]
  then
    infoWith "Installing" $1
    $2
  fi
}
