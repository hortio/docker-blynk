#!/usr/bin/env bash

VERSION=0.39.10

docker build . -t hortio/blynk:latest -t hortio/blynk:v${VERSION}
docker push hortio/blynk:latest
docker push hortio/blynk:v${VERSION}