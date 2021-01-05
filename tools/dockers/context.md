# docker context objects

TLDR: 
  - simplify configuring connection details for multiple environments
    - perhaps: workstation, testing server, production cluster, ...
    - alternative to `DOCKER_HOST` (etc) env vars, CLI args, config file values, etc 
  - name the connection
  - easily switch connections with `docker context use NAME`
  - IMHO: open the door to managing all sorts of endpoints beyond just daemon sockets

## Context data

- `Name`
- `Endpoints`

## Before `docker context`

- We had:
  - `DOCKER_HOST` env var, `docker -H/--host` cli arg, and `host` client config field
  - All just to provide the socket to connect to
  - Unless the host had meaningful named sockets, good luck remembering them!
  - I remember writing little scripts to "setup the environment"
  - I remember `docker-machine env default` too!