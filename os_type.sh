OS_TYPE=""

case $(uname -m) in
    i386)   OS_TYPE="386" ;;
    i686)   OS_TYPE="386" ;;
    x86_64) OS_TYPE="amd64" ;;
    arm64)  OS_TYPE="arm64" ;;
    arm)    dpkg --print-architecture | grep -q "arm64" && OS_TYPE="arm64" || OS_TYPE="arm" ;;
    armv7l) OS_TYPE="armv7l"
esac

echo "$OS_TYPE"
