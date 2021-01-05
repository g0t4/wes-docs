# docker context objects

TLDR:

- simplify configuring connection details for multiple environments
  - perhaps: workstation, testing server, production cluster, ...
  - alternative to `DOCKER_HOST` (etc) env vars, CLI args, config file values, etc
- name the connection
- easily switch connections with `docker context use NAME`
- IMHO: open the door to managing all sorts of endpoints beyond just daemon sockets

## Context data

Here's a hacked sample off `docker context inspect` output with some commentary
```json
{
  "Name": "prod-swarm",
  "Metadata": {
    "Description": "My prod cluster.",
    "StackOrchestrator": "swarm" // default orchestrator when using `docker stack` commands
      // replaces `DOCKER_STACK_ORCHESTRATOR` / `--orchestrator` / `stackOrchestrator`
  },
  "Endpoints": {
    "docker": {
      "Host": "unix:///var/run/docker.sock", // replaces `DOCKER_HOST` / `-H/--host`
      "SkipTLSVerify": false // replaces `DOCKER_TLS_VERIFY` / `--tls`, `--tlsverify bool`
    }
  },
  // `DOCKER_CERT_PATH` / `--tlscacert string`, `--tlscert string`, `--tlskey string` - todo show mapping example
  "TLSMaterial": {},
  "Storage": {
    "MetadataPath": "~/.docker/contexts/meta/hash",
    "TLSPath": "~/.docker/contexts/tls/hash"
  }
}
```

## Before `docker context`

- We had:
  - `DOCKER_HOST` env var, `docker -H/--host` cli arg
  - Unless the host had meaningful named sockets, good luck remembering them!
  - I remember writing little scripts to "setup the environment"
  - I remember `docker-machine env default` too!
