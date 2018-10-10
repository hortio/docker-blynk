FROM alpine:3.8 as downloader

ENV VERSION 0.39.10

RUN apk add --no-cache wget
RUN wget "https://github.com/blynkkk/blynk-server/releases/download/v${VERSION}/server-${VERSION}.jar" -O /server.jar


FROM openjdk:11-jre-slim
LABEL maintainer="Sergei Silnov <po@kumekay.com>"

COPY  --from=downloader /server.jar /blynk/server.jar

WORKDIR /blynk

# Ports: 9443 (secure), 8080 (plain)
EXPOSE 8080 9443

ENTRYPOINT ["java", "-jar", "server.jar"]  
CMD ["-dataFolder", "/data"]
