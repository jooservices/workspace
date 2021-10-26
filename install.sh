#!/bin/bash

source init/init.sh

source oses/init.sh

funcPromptInstall "MariaDB" oses/mariadb.sh

if [ $IS_ARMV7L ]; then
  funcPromptInstall "Mongodb" oses/armv7l/mongodb.sh
else
  funcPromptInstall "Mongodb" oses/x86_x64/mongodb.sh
fi

funcPromptInstall "PHP" oses/php.sh

funcPromptInstall "Caching" oses/caching.sh

funcPromptInstall "Nginx" oses/nginx.sh

if [ $IS_ARMV7L ]; then
  echo "Can not install Nodejs"
else
  funcPromptInstall "Nodejs" oses/x86_x64/mongodb.sh
fi

funcPromptInstall "Composer" oses/composer.sh

funcPromptInstall "Supervisor" oses/supervisor.sh

if [ $IS_ARMV7L ]; then
  funcPromptInstall "Docker" oses/armv7l/docker.sh
else
  funcPromptInstall "Docker" oses/x86_x64/docker.sh
fi

funcPromptInstall "Webmin" oses/webmin.sh

ssh-keygen -t ed25519 -C "jooservices@gmail.com"
