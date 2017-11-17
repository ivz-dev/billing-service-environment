#!/usr/bin/env bash

docker volume create --name mysql
docker build -t billing .
git clone https://github.com/ivz-dev/billing-project.git ~/billing-service/
cd ~/billing-service/
npm i
docker run -d -p 8585:8080 -v mysql:/var/lib/mysql -v ~/billing-service/:/src/ billing

