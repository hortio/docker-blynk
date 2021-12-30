# Docker container for Blynk server (v0.41.17)

[Blynk server](https://github.com/blynkkk/blynk-server) is an open source server to be used as back end for IoT projects. It works with Android and iOS apps that provide simple still powerful interface to your internet connected devices like ESP8266, ESP32, Raspbery Pi and Arduino.

Goal of this project is to provide a simple way to install Blynk server to own server/hardware

- `docker-compose.yml` - Docker compose config with all necessary volumes mounted and automatic updates provided by [watchtower](https://github.com/v2tec/watchtower)
- `server.properties` contains all possible config options, but will require you to provide only 4 values to run secure server on your hardware

Docker image is available on Docker Hub: [hortio/blynk](https://hub.docker.com/r/hortio/blynk/). Please note, that only **x86** systems is only supported at this moment.

## Requirements

Server should have `docker` and `docker-compose` (recommended) installed.
It's better to follow official instructions to install them:

- [Install Docker](https://docs.docker.com/install/)
- [Install Docker Compose](https://docs.docker.com/compose/install/)

## Recommended flow: running using docker compose

- SSH to your server and make sure that `docker` and `docker-compose` installed
- Clone this repo onto your server `git clone https://github.com/hortio/docker-blynk.git`
- Go to directory: `cd docker-blynk`
- Go through configuration in `server.properties`. In the simplest case you should only change `server.host`, `contact.email`, `admin.email` and `admin.pass`
- Run `docker-compose up -d`
- That's it, server will be updated to the latest version automatically.

If you don't want to use automatically generated Let's encrypt certificates or you a reverse proxy (like nginx or traefik) on port 80, remove `- "80:8080"` from ports section of `docker-compose.yml` and setup your reverse proxy to forward port 80 of your hostname to port 8080

## Running without docker-compose

- Clone this repo onto your server `git clone https://github.com/hortio/docker-blynk.git`
- Go to directory: `cd docker-blynk`
- Go through configuration in `server.properties`. In the simplest case you should only change `server.host`, `contact.email`, `admin.email` and `admin.pass`
- Run blynk itself:

```
docker run -d -p 8080:8080 -p 80:8080 -p 9443:9443 -v `pwd`/server.properties:/blynk/server.properties -v `pwd`/mail.properties:/blynk/mail.properties -v `pwd`/data:/data -v `pwd`/logs:/blynk/logs  hortio/blynk:latest -dataFolder /data -serverConfig /blynk/server.properties
```

- That's it. Server's data will be persisted in `data` directory, logs will be accessible in `logs`

If you don't want to use automatically generated Let's encrypt certificates or you use some reverse proxy like nginx or traefik on port 80, just remove `-p 80:8080` from docker run command.

## Questions, bugs and contributions

Feel free to open issue or make a pull request
