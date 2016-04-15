
Full documentation is [here](https://docs.go.cd/current/installation/index.html)

## Go CI directories

| Directory                | Description
|--------------------------|-----------------
| `/var/lib/go-server`     | contains the binaries and database
| `/etc/go`                | contains the pipeline configuration files
| `/var/log/go-server`     | contains the server logs
| `/usr/share/go-server`   | contains the start script
| `/etc/default/go-server` | contains all the environment variables with default values. These variable values can be changed as per requirement.


To allow Go CI server running inside Docker image we need to change default setting in `/etc/default/go-server`:

```
...
DAEMON=N
...
```
