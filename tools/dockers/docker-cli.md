# docker (CLI)

## Cheatsheet


## Configuration File

LEGEND:
- `UNDERSCORE_CAPS` = environment variable
- `--arg` = cli arg/flag
- `lowercase` = `config.json` property (key)

### Where is the docker client config file?

- [docs](https://docs.docker.com/engine/reference/commandline/cli/#change-the-docker-directory)
- In order of precedence (last wins)
  - **Default:** [`~/.docker/config.json`](https://docs.docker.com/engine/reference/commandline/cli/#configjson-properties)
    - Note: `~/.dockercfg` was used up until v1.7 for storing registry credentials 
  - `DOCKER_CONFIG`
  - `docker --config PATH`

### What's in `config.json`

- https://docs.docker.com/engine/reference/commandline/cli/#configjson-properties

## Configuration Options

I think it's best to look at options across mechanisms to change them and not group by mechanism.

- [client reference docs](https://docs.docker.com/engine/reference/commandline/cli)

- Modern "Context" options: see [context.md](./context.md)
- Legacy "Context" options - 
  - *Wes says legacy b/c these used to be how you would configure options that are now housed under `docker context`*
    - *that said, these still work affording fine grain overrides to individual `context fields`*
  - HOST - daemon socket (endpoint)
    - `DOCKER_HOST` / `-H/--host`
    - `DOCKER_API_VERSION`
    - `DOCKER_CERT_PATH` / `--tlscacert string`, `--tlscert string`, `--tlskey string`
    - `DOCKER_TLS_VERIFY` / `--tls`, `--tlsverify bool`
  - `DOCKER_STACK_ORCHESTRATOR` / `--orchestrator` / `stackOrchestrator` - "swarm", "kubernetes", "all" - set default orchestrator for stack commands
  - `DOCKER_DEFAULT_PLATFORM`
- Content Trust
  - `DOCKER_CONTENT_TRUST` / `--disable-content-trust`
  - `DOCKER_CONTENT_TRUST_SERVER` / 
- Command output formatting
  - [`psFormat`](https://docs.docker.com/engine/reference/commandline/ps/)
  - [`imagesFormat`](https://docs.docker.com/engine/reference/commandline/images/)
  - [`pluginsFormat`](https://docs.docker.com/engine/reference/commandline/plugin_ls/)
  - [`servicesFormat`](https://docs.docker.com/engine/reference/commandline/service_ls/)
  - [`serviceInspectFormat`](https://docs.docker.com/engine/reference/commandline/service_inspect/)
  - [`statsFormat`](https://docs.docker.com/engine/reference/commandline/stats/)
  - [`secretFormat`](https://docs.docker.com/engine/reference/commandline/secret_ls/)
  - [`nodesFormat`](https://docs.docker.com/engine/reference/commandline/node_ls/)
  - [`configFormat`](https://docs.docker.com/engine/reference/commandline/config_ls/)
- Credential storage
  - `credsStore`
  - `credHelpers`
- Container defaults
  - `proxies` - default proxies for all containers
  - `HTTP_PROXY`, `HTTPS_PROXY`, `FTP_PROXY`, `NO_PROXY`
    - `httpProxy` / `httpsProxy` / `ftpProxy` / `noProxy`
- Misc
  - `plugins` - CLI plugins to include, and map of configuration for the plugin
  - `DOCKER_HIDE_LEGACY_COMMANDS`