#!/usr/bin/env bash

# Exit if there's no arguments
if [[ $# -eq 0 ]] ; then
    echo 'Supply database name as argument. For example "bash .docker/scripts/install-site.sh drupaldb", or if using composer "composer site-install drupaldb".'
    exit 0
fi

PROJECT_NAME=$(basename "$(pwd)")
WEBSERVER=$PROJECT_NAME"_webserver_1"
DBNAME=$1

docker exec -i $WEBSERVER bash -c "cd web \
&& ../vendor/bin/drush -y site-install --db-url=mysql://root:password@database:3306/$DBNAME --account-name=rtd.admin --account-pass=password"
