#!/bin/bash

source os_type.sh

source general/init.sh

source functions/prompt_yn.sh

funcPromptInstall "MariaDB" general/mariadb.sh

if [ "$OS_TYPE" = "armv7l" ]; then
  echo "Will not install Mongodb on Pi 4"
else
  funcPromptInstall "Mongodb" ubuntu/mongodb.sh
fi

funcPromptInstall "PHP" general/php.sh

funcPromptInstall "Nginx" general/nginx.sh

funcPromptInstall "Composer" general/composer.sh

funcPromptInstall "Supervisor" general/supervisor.sh

if [ "$OS_TYPE" = "armv7l" ]; then
  funcPromptInstall "Docker" armv7l/supervisor.sh
else
  funcPromptInstall "Docker" ubuntu/supervisor.sh
fi

funcPromptInstall "Webmin" general/webmin.sh
