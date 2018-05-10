# About

This repo is used for examples used during Advanced Docker webinar on 10.5.2018

# Installing

## Create .env file inside myapp dir (example below)

```
DB_USER=user
DB_PASS=pass
DB_HOST=dbhostname-or-ip
DB_NAME=dbname
DB_PORT=3306
```

## Build Docker image

```shell
cd public-docker-webinar
sudo docker build . -t username:image-name
```

## Uploading image to Hyper.sh

```shell
docker image save username:image-name -o image.tar
cat image.tar | hyper load

```

# Installing docker on Ubuntu 18.04

You can use install_docker.sh to install docker-ce on Ubuntu 18.04

# TODO

Add webinar video later and presentation
