FROM widgetpl/docker-ubuntu-java:jre7

MAINTAINER Michal Dziedziela <michal.dziedziela@gmail.com>

# Java Version
ENV GOCI_SERVER_VERSION=16.3.0-3183

RUN apt-get update \
    && apt-get install unzip \
    && curl -o go-server.deb https://download.go.cd/binaries/16.3.0-3183/deb/go-server-${GOCI_SERVER_VERSION}.deb \
    && sudo dpkg -i go-server.deb \
    && rm go-server.deb \
    && apt-get autoremove -y \
    && apt-get clean install \
    && rm -rf /var/lib/apt/lists/*

COPY go-server /etc/default/go-server

ENTRYPOINT ["/bin/bash", "/usr/share/go-server/server.sh"]
