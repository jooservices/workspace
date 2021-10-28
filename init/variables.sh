GITHUB_URL="https://raw.githubusercontent.com/jooservices/workspace/main/"
OSES_PATH="${PWD}/oses"

OS_TYPE=$(uname -m)
OS=$(grep -oP '(?<=^ID=).+' /etc/os-release | tr -d '"')
OS_VERSION=$(grep -oP '(?<=^VERSION_ID=).+' /etc/os-release | tr -d '"')

if [ "$OS_TYPE" = "armv7l" ]; then
  IS_ARMV7L=true
else
  IS_ARMV7L=false
fi

# Colors
#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

# System
RAM_TOTAL=$(awk '/MemTotal/ {print $2}' /proc/meminfo)

if [ "$OS" = "raspbian" ]; then
  LOW_RAM='2097152'
else
  LOW_RAM='4194304'
fi

CPU_CORES=$(grep -c "processor" /proc/cpuinfo)
MAX_CLIENT=$((CPU_CORES * 1024))


SCRIPT_URL="$GITHUB_URL/$OS/$OS_VERSION"
OS_PATH="${PWD}/oses/${OS}"

# Messages
ROOT_REQUIRED="Please execute script under root permission"
EXITING="Exiting"
MINIMUM_RAM_REQUIRED="Total RAM is not enough. Minimum required ${LOW_RAM} KB"

#
IPADDRESS=$(curl -s http://cyberpanel.sh/?ip)
