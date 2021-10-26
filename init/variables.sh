CURRENT_DIR=$(echo $PWD)
OS_TYPE=$(uname -m)
OS_CPU=$(uname -p)
if [ "$OS_TYPE" = "armv7l" ]; then
  IS_ARMV7L=true
else
  IS_ARMV7L=false
fi
