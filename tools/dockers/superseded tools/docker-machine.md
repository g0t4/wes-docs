# docker-machine

- `docker-machine` was an evolution of [Boot2Docker](https://docs.docker.com/machine/migrate-to-machine/)
- **`docker-machine` is marked superseded**

NOTE: this is for historical purposes only and is not complete given the superseded state of `docker-machine`

## When to use `docker-machine`

- Local Mac/Windows docker installs:
  - **single** stand-alone node - use `Docker Desktop for Mac/Windows`
    - Caveat: `DDfM/W` is an evolution of the ideas behind `docker-machine` but tied down to the most performant hypervisor available for each platform and over time `DDfM/W` has been ruthlessly optimized to `just work` really well as if natively installed.  
    - `docker-machine` predates `Docker Desktop`
      - and it was bundled along with `Docker Desktop`
  - For **multiple** node installs even on Mac/Windows - use `docker-machine`
- Remote docker installs:
  - Cloud installs:
    - https://docs.docker.com/machine/get-started-cloud/
    - [digital ocean](https://docs.docker.com/machine/examples/ocean/)
    - [AWS EC2](https://docs.docker.com/machine/examples/aws/)
    - [... machine drivers](https://docs.docker.com/machine/drivers/) make `docker-machine` capable of spinning up machines all over the clouds
  - ![multi node setup - image from docs.docker.com/machine](https://docs.docker.com/machine/img/provision-use-case.png)
- On older windows/mac versions (doubtful many do this but hey, it is possible)

## Releases

- [Release Notes](https://docs.docker.com/machine/release-notes/)
  - Hasn't been updated since [0.16.2 (2019-09-02)](https://docs.docker.com/machine/release-notes/#0162-2019-09-02)

## Installing

- [Completions](https://docs.docker.com/machine/completion/)

## CLI reference

- https://docs.docker.com/machine/reference/

## Concepts

- https://docs.docker.com/machine/concepts/