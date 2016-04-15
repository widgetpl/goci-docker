FROM widgetpl/docker-ubuntu-java:jre7

MAINTAINER Michal Dziedziela <michal.dziedziela@gmail.com>

# Java Version
ENV GOCI_AGENT_VERSION=16.3.0-3183

RUN apt-get update \
    && apt-get install unzip \
    && curl -o go-agent.deb https://download.go.cd/binaries/16.3.0-3183/deb/go-agent-${GOCI_AGENT_VERSION}.deb \
    && sudo dpkg -i go-agent.deb \
    && rm go-agent.deb \
    && apt-get autoremove -y \
    && apt-get clean install \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/bin/bash", "/usr/share/go-server/agent.sh"]
