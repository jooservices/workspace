source init/variables.sh
source init/functions.sh

#if [[ "$(id -u)" != "0" ]]; then
#    printf "${RED}%s${NC}\n" "${ROOT_REQUIRED}"
#    printf "${RED}%s${NC}\n" "${EXITING}"
#    exit
#fi

infoWith "Init on $PWD by user:" "$USER"
infoWith "OS:" "$OS"
infoWith "OS type:" "$OS_TYPE"
infoWith "Kernel version:" "$(uname -r)"
