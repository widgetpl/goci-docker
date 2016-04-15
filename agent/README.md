
Full documentation is [here](https://docs.go.cd/current/installation/index.html)

## Go CI directories

| Directory                | Path to mount |  Description
|--------------------------|---------------|-----------------
| `/var/lib/go-agent `     | Y             | contains the binaries
| `/var/log/go-agent`      | Y             | contains the agent logs
| `/usr/share/go-agent `   | N             | contains the start script
| `/etc/default/go-agent`  | N             | contains all the environment variables with default values. These variable values can be changed as per requirement.


To allow Go CI server running inside Docker image we need to change default setting in `/etc/default/go-agent`:

```
...
DAEMON=N
...
```

Default go-agent config:

```
GO_SERVER=127.0.0.1
export GO_SERVER
GO_SERVER_PORT=8153
export GO_SERVER_PORT
AGENT_WORK_DIR=/var/lib/${SERVICE_NAME:-go-agent}
export AGENT_WORK_DIR
DAEMON=Y
VNC=N
export JAVA_HOME="/usr/lib/jvm/java-7-openjdk-amd64/jre" # SET_BY_GO_INSTALLER__DONT_REMOVE
```

To properly configure your agent you have to create your own `/etc/default/go-agent` file with proper server properties and mount it to container path `/etc/default/go-agent`.

