#!/bin/bash

AGENT_VERSION=16.3.0-3183-2

docker build -t widgetpl/docker-goci-agent:${AGENT_VERSION} .

#docker push widgetpl/docker-goci-agent:${AGENT_VERSION}
