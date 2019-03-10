FROM openjdk:11-jre-slim
LABEL maintainer="Sergei Silnov <po@kumekay.com>"

ENV VERSION 0.41.3
ADD "https://github.com/blynkkk/blynk-server/releases/download/v${VERSION}/server-${VERSION}.jar"  /blynk/server.jar

WORKDIR /blynk

# Ports: 9443 (secure), 8080 (plain)
EXPOSE 8080 9443

ENTRYPOINT ["java", "-jar", "server.jar"]  
CMD ["-dataFolder", "/data"]
