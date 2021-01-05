# Docker Engine API - socket types

## Server - config sockets to listen on

- `dockerd -H/-host` cli flag 
  - `dockerd -H` specifies the socket(s) 
  - multiple `-H` allowed to listen on multiple sockets
  - `dockerd` reference has a help section on socket types
    - https://docs.docker.com/engine/reference/commandline/dockerd/#daemon-socket-option
- Client config:
  - `docker -H` or `DOCKER_HOST` env var to select socket to connect to
  - Or, contexts!

## 1. unix domain socket (DEFAULT)

- **default** socket at `/var/run/docker.sock`
  - aka IPC socket
- authentication via filesystem permissions:
  - root:docker
  - root:root (if no docker group)

## 2. TCP socket

- Use a `tcp` socket for `remote access`

### HTTP

- default is
  - `-H tcp://` shorthand
    - equivalent to `-H tcp://0.0.0.0:2375`
  - not encrypted (HTTP)
    - standard port is 2375
  - not authenticated

### Security - limit IP binding

- `-H tcp://192.168.0.0:2375`
- Limiting sockets limits access to applicable networks

### Security - HTTPS - encrypting communications

- Use built-in TLS (HTTPS) to encrypt traffic
  - standard port 2376
- Client enable TLS:
  - `docker --tlsverify`
  - export DOCKER_TLS_VERIFY=1; docker ....
- OR, add a proxy
  - env vars: `HTTP_PROXY`/`HTTPS_PROXY`/`NO_PROXY` (lowercase ok)
 
### Authentication (who are you!)

- Use client certificates

### SSH client connections

- First, make sure you can ssh to server
  - `ssh me@server.com`
  - auth requires PKA
    - not password auth
  - if client key has passphrase - use `ssh-add`
- I think of this as syntactic sugar
  - So, you can connect via SSH and run docker:
    ```bash
      ssh me@server.com
      docker ps
    ```
  - OR, tell docker to do it for you
    `docker -H ssh://me@server.com ps`
    ```bash
      export DOCKER_HOST=ssh://me@server.com
      docker ps
    ```
- FYI, use `docker info` or another command that uniquely identifies the server (perhaps `docker image ls`) to test/check what you are connected to.

### fd - `systemd` socket activation

- On `systemd` systems:
  - `-H fd://`
    - or, specify individual sockets `-H fd://NUMBER`
  - examples: https://github.com/moby/moby/tree/master/contrib/init/systemd
  - `systemd units`
    - `docker.service` describes the daemon and its config
    - `docker.socket` describes the actual socket(s) to use
  - `systemd` can (and usually is) configured to
    - launch `docker.service`
    - on first request to `docker.socket`
    - `socket activation` involves a service listening on a `virtual` socket if you will, a placeholder `fd://` = `fd://1`
      - imagine variable interpolation between `socket` and `service` `unit files`
      - you can then redefine the sockets in a consistent manner
      - then when `docker.socket` is launched, the real sockets are created and when a message comes in, `docker.service` is started if not already.... and the real socket is mapped to the virtual placeholder in `docker.service`

### demystify and experiment with backgrounding dockerd

- When learning it is convenient to bypass external service managers like systemd and just run `dockerd` directly and follow the line with an `&` to send th process to the background of your shell
  - ```bash
      dockerd -H EXPERIMENT &
    ```
  - Obviously this isn't repeatable and a simple restart or unhandled exception means you have to start it back up (hence the value of service managers like systemd)
