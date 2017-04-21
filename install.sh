#!/usr/bin/env bash

DBUSER=root
DBPASSWORD=root
DBHOST=127.0.0.1
DBPORT=3306
DBNAME=typo3composer
ADMIN_NAME=admin
ADMIN_PASSWORD=123password!
SITENAME=site
LOCALES=de,fr

composer install

vendor/bin/typo3cms install:fixfolderstructure

if [ ! -f web/typo3conf/LocalConfiguration.php ]; then
    vendor/bin/typo3cms install:setup --non-interactive \
        --database-user-name=$DBUSER \
        --database-user-password=$DBPASSWORD \
        --database-host-name=$DBHOST \
        --database-port=$DBPORT \
        --database-name=$DBNAME \
        --admin-user-name=$ADMIN_NAME \
        --admin-password=$ADMIN_PASSWORD \
        --site-name=$SITENAME \
        --site-setup-type=no \
        --use-existing-database
fi

vendor/bin/typo3cms install:generatepackagestates
vendor/bin/typo3cms extension:setupactive
vendor/bin/typo3cms database:updateschema
vendor/bin/typo3cms upgrade:all
vendor/bin/typo3cms language:update $LOCALES
vendor/bin/typo3cms cache:flush