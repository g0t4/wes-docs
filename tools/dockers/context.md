# docker context objects

TLDR: 
  - simplify configuring all the connection details for each environment
    - a given context entails more than just a socket for a standalone docker engine instance
    - and name each set (context)
  - and easily switch with `docker context use FOO`

## Notes

- `Context` contains a set of possible endpoints
- `Name` is a way to categorize/label a set of connection details
  - and easily switch between them
- In the past we had:
  - `DOCKER_HOST` env var, `docker -H/--host` cli arg, and `host` client config field
    - All just to provide the socket to connect to
    - Unless the host had meaningful named sockets, good luck remembering them!
    - I remember writing little scripts to "setup the environment"
    - I remember `docker-machine env default` too!
      - [docker-machine](https://docs.docker.com/machine/) predates Docker Desktop for Mac/Windows and was part of the Docker Toolbox. It is much like `vagrant + only the vagrant docker provisioner` - creates VMs locally, manages the installed version of `Docker Engine` (`client` and `server`) and manages the VM (`start`, `stop`, `restart`, `inspect`, `destroy`)
      - 