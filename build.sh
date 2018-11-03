#!/usr/bin/env bash

VERSION_MAJOR_MINOR=0.40
VERSION_PATCH=2

docker build . -t hortio/blynk:latest -t hortio/blynk:v${VERSION_MAJOR_MINOR}.${VERSION_PATCH} -t hortio/blynk:v${VERSION_MAJOR_MINOR}
docker push hortio/blynk:latest
docker push hortio/blynk:v${VERSION_MAJOR_MINOR}.${VERSION_PATCH}
docker push hortio/blynk:v${VERSION_MAJOR_MINOR}