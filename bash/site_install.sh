#!/bin/sh

# include parse_yaml function
. ./bash/parse_yaml.sh

# read yaml file
eval $(parse_yaml local-settings.yml "config_")

# access yaml content
# Install Drupal based on yml config
cd web
drush si -y standard --db-url=mysql://$config_development_dbuser:$config_development_dbpw@$config_development_dbhost/$config_development_dbname --account-name=ovprea --account-pass=Oked_dev5 --config-dir="../config/sync" --notify="global"