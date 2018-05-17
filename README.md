# About

This repo is used for examples used during Advanced Docker webinar on 17.5.2018

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
docker build . -t username:image-name
```

## Uploading image to Hyper.sh

```shell
docker image save username:image-name -o image.tar
cat image.tar | hyper load

```

# Installing docker on Ubuntu 18.04

```shell
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic test"
sudo apt update
sudo apt install docker-ce
```

# TODO

Add webinar video later and presentation
