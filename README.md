# RTD Drupal Composer Template #
This project is a fork of https://github.com/drupal-composer/drupal-project.

## Composer Tasks ##
- `composer create-project`: Executes `composer install` and sets up a Bootstrap child theme. 
- `composer install`: Downloads dependencies specified on composer.json file. Creates a `composer.lock` file.
- `composer require [package-name]`: Adds a new dependency. Modifies `composer.json` and `composer.lock` files.
- `composer update`: Updates all dependencies. Avoid running this command as it will create merge nightmares.
- `composer test`: Runs PHP lint and Coder sniffing tools on custom modules directory (`web/modules/custom`).
- `composer site-install [db-name]`: If the supplied docker tools are being used, this command will run `drush site-install` with the folloing default settings: admin account: rtd.web, admin password: password.

## Docker ready ##
A `docker-compose.yml` file and a `.docker` directory is included in this repo to allow you to quickly create a container-based LAMP stack.

### What is Docker? ###
The following definitions will help you understand how Docker works.

- Docker: The software that allows you to build or fetch images; create containers; and execute programs provided by the containers.
- Docker compose: A tool bundled with Docker that allows you to orchestrate containers.
- Container: A running lightweight server that provides a service (e.g. apache, mysql, redis, etc).
- Image: The blueprint of a container. A strip-down server that provides a service.
- Base image: Any of the official images (e.g. Ubuntu) or simply a custom image that another image builds upon.
- Dockerfile: A file that tells Docker how to create an image.
- docker-compose.yml: A file that tells docker how to link services together.
- Service: A name to reference a container. The service that a container provides.

### Spin up a site ###
1. Install [docker](https://store.docker.com/editions/community/docker-ce-desktop-mac).
2. Run `docker-compose up -d` to build docker images and to create the webserver and database containers.
3. Run `docker-compose ps` to find out what the **webserver's name** and **port numbers** are (e.g. 32827->80).
4. Run `bash .docker/scripts/create-site.sh` to create drupal project via composer.
5. Optionally run `bash .docker/scripts/install-site.sh drupal` to install a site by skipping the web-based wizard.
6. Open a web browser and go to http://localhost:[port-number]

### Database Information ###
- Host: database
- Database: drupal (created by default).
- UN: root
- PW: password
- Port: The port is assigned randomly every time the the mysql container is started. Follow step 3 on **Spin up a site** to find out how to check the port number for a service.

### XDebug ###
XDebug is already installed, but it's disabled by default as it slows down the site. To enable it run the following commands:
- Run `docker exec -it [webserver-name] /bin/bash` to ssh into the webserver container.
- Run `vi /etc/php.d/xdebug.ini` and remove the leading ';' on line 1.
- Run `docker-compose restart`.
- Run `docker-compose ps` to see the containers new port numbers.

## Drush ##
Sample command to get a URL to log in as user 1:
`docker exec -i [webserver-name] bash -c "cd web && ../vendor/bin/drush uli"`

## TODO ##
- Write script to automate enabling and disabling xdebug.
- Write a drush wrapper script.
