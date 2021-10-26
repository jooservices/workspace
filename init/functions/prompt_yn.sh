funcPromptInstall(){
  read -p "Install $1: " confirm
  if [ $confirm = "y" ]
  then
    echo "Installing $1"
    source $2
    echo "$OS_TYPE"
  fi
}
