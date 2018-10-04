# Docker container for Blynk server
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

## Recommended flow

- SSH to your server and make sure that `docker` and `docker-compose` installed
- Clone this repo onto your server `git clone https://github.com/hortio/docker-blynk.git`
- Go through configuration in `server.properties`. In the simplest case you should only change `server.host`, `contact.email`, `admin.email` and `admin.pass`
- Run `docker-compose up -d`
- That's it, server will be updated to the latest version automatically.

## Questions, bugs and contributions
Feel free to open issue or make a pull request
