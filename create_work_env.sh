#!/usr/bin/env bash

docker volume create --name mysql
docker build -t billing .
git clone https://github.com/ivz-dev/billing-project.git /var/www/billing-service/
cd /var/www/billing-service/
npm i
docker run --name billing-service -d -p 82:8080 -v mysql:/var/lib/mysql -v /var/www/billing-service/:/src/ billing
