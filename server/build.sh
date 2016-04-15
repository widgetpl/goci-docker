#!/bin/bash

SERVER_VERSION=16.3.0-3183

docker build -t widgetpl/docker-goci-server:${SERVER_VERSION} .

docker push widgetpl/docker-goci-server:${SERVER_VERSION}
