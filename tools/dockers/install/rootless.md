# rootless build

- [rootless docs](https://docs.docker.com/engine/security/rootless/)

## Install from convenience script

- https://get.docker.com/rootless
  - versioned: https://github.com/docker/docker-install
  - see [rootless install script from source](./install.rootless.from.source.sh)

## Steps of convenience script

- [`do_install`](https://github.com/docker/docker-install/blob/a11ea7368b9bb21f310738b13a0e008acac96ab8/rootless-install.sh#L221)
  - [`init_vars`](https://github.com/docker/docker-install/blob/a11ea7368b9bb21f310738b13a0e008acac96ab8/rootless-install.sh#L57)
    - `DOCKER_BIN` env var `parameter` - defaults to $HOME/bin
    - `DAEMON` var set to `dockerd`
    - `SYSTEMD` set to `1` if `--user` deamon reloads indicating support for [per-user daemon](https://wiki.archlinux.org/index.php/Systemd/User)
  - [`checks`](https://github.com/docker/docker-install/blob/a11ea7368b9bb21f310738b13a0e008acac96ab8/rootless-install.sh#L67)
    - [ensure `linux` OS, if not then warn and exit](https://github.com/docker/docker-install/blob/a11ea7368b9bb21f310738b13a0e008acac96ab8/rootless-install.sh#L68-L75)
    - [ensure not root user, unless forced](https://github.com/docker/docker-install/blob/a11ea7368b9bb21f310738b13a0e008acac96ab8/rootless-install.sh#L77-L80)
    - [ensure $HOME exists](https://github.com/docker/docker-install/blob/a11ea7368b9bb21f310738b13a0e008acac96ab8/rootless-install.sh#L82-L85)
    - [ensure $HOME/bin or $HOME is writable](https://github.com/docker/docker-install/blob/a11ea7368b9bb21f310738b13a0e008acac96ab8/rootless-install.sh#L87-L95)
    - [ensure docker rootful not already installed](https://github.com/docker/docker-install/blob/a11ea7368b9bb21f310738b13a0e008acac96ab8/rootless-install.sh#L97-L100)
      - `FORCE_ROOTLESS_INSTALL=1` to ignore.
    - [validate $XDG_RUNTIME_DIR](https://github.com/docker/docker-install/blob/a11ea7368b9bb21f310738b13a0e008acac96ab8/rootless-install.sh#L102-L111)
    - [verify no previous rootless install, if not then print instructions](https://github.com/docker/docker-install/blob/a11ea7368b9bb21f310738b13a0e008acac96ab8/rootless-install.sh#L113-L119)
    - [ensure newuidmap binary present or install it... bail on fail](https://github.com/docker/docker-install/blob/a11ea7368b9bb21f310738b13a0e008acac96ab8/rootless-install.sh#L123-L136)
    - [ensure iptables present](https://github.com/docker/docker-install/blob/a11ea7368b9bb21f310738b13a0e008acac96ab8/rootless-install.sh#L138-L150)
    - [ensure iptables module loaded](https://github.com/docker/docker-install/blob/a11ea7368b9bb21f310738b13a0e008acac96ab8/rootless-install.sh#L152-L156)
    - [ensure a few userns setttings]
    - [print commands (built up over above checks) if anything missing and bail](https://github.com/docker/docker-install/blob/a11ea7368b9bb21f310738b13a0e008acac96ab8/rootless-install.sh#L180-L191)
    - ... - [ ] TODO
  - [Downloads both static release and rootless extras static release](https://github.com/docker/docker-install/blob/a11ea7368b9bb21f310738b13a0e008acac96ab8/rootless-install.sh#L230-L231)
    - hence `extras` in name for rootless
  - [Extracted to $HOME/bin](https://github.com/docker/docker-install/blob/a11ea7368b9bb21f310738b13a0e008acac96ab8/rootless-install.sh#L233-L239)
  - [run setup tool](https://github.com/docker/docker-install/blob/a11ea7368b9bb21f310738b13a0e008acac96ab8/rootless-install.sh#L217)
