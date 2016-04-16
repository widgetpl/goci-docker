FROM widgetpl/docker-ubuntu-java:jre7

MAINTAINER Michal Dziedziela <michal.dziedziela@gmail.com>

# Go CI agent version
ENV GOCI_AGENT_VERSION=16.3.0-3183 \
  GRADLE_VERSION=2.12 \
  SBT_VERSION=0.13.9 \
  MAVEN_VERSION=3.3.9 \
  GRADLE_HOME=/usr/share/gradle \
  SBT_HOME=/usr/share/sbt \
  MAVEN_HOME=/usr/share/maven \
  NPM_CONFIG_LOGLEVEL=info \
  _JAVA_OPTIONS="-Dsbt.log.noformat=true"

RUN apt-get update \

  # Make sure the package repository is up to date.
  && apt-get install -y unzip git openssh-client unzip wget bzip2 nodejs npm gitstats python-yaml \
  && npm install npm -g \
  && npm install -g bower \
  && ln -s /usr/bin/nodejs /usr/bin/node \

  # Install Go Ci agent
  && curl -o go-agent.deb https://download.go.cd/binaries/16.3.0-3183/deb/go-agent-${GOCI_AGENT_VERSION}.deb \
  && sudo dpkg -i go-agent.deb \
  && rm go-agent.deb \

  # install gradle 
  && curl -L https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-all.zip > /usr/share/gradle-$GRADLE_VERSION-all.zip \
  && unzip -d /usr/share/ /usr/share/gradle-$GRADLE_VERSION-all.zip \
  && ln -s /usr/share/gradle-$GRADLE_VERSION /usr/share/gradle \
  && rm /usr/share/gradle-$GRADLE_VERSION-all.zip \
  && ln -s /usr/share/gradle/bin/gradle /usr/bin/gradle \

  # clean all cache to clean space
  && apt-get autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \

  # install maven
  && curl -fsSL http://apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz | tar xzf - -C /usr/share \
  && mv /usr/share/apache-maven-$MAVEN_VERSION /usr/share/maven \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn \

  # install sbt
  && mkdir -p $SBT_HOME \
  && curl -L https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/$SBT_VERSION/sbt-launch.jar > $SBT_HOME/sbt-launch.jar \
  && echo '#!/bin/bash\njava $SBT_OPTS -jar $SBT_HOME/sbt-launch.jar "$@"' > /usr/bin/sbt \
  && chmod a+x /usr/bin/sbt \
  && sbt exit \
  && rm -fr /tmp/*  

ENTRYPOINT ["/bin/bash", "/usr/share/go-agent/agent.sh"]
