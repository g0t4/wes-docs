# boxes

## Finding boxes

- HashiCorp's [Vagrant Cloud](https://app.vagrantup.com/boxes/search)
  - Vagrant Cloud / Docker Hub are conceptually the same registries in many ways
    - Vagrant distributes `boxes` for `virtual machines` 
      - essentially a `filesystem` 
        - + `metadata` for the base config of the VM/environment
    - Docker Hub distributes `images` for `containers`, `images` have the `filesystem` for the `container` + `metadata` for the `app(s)` to run - the `environment`!  
    - Interstingly `boxes` can be used for `containers` and Docker Hub `images` can be used for `VMs` (see [`kata-containers`](https://katacontainers.io/) for an example)
      - `vagrant` has another example with its docker provisioner (essentially makes the VM even more transparent so that the containers on it are the prominent feature)

## What is a box?

- `boxes` are a packaging format 
- used by `vagrant` to **distribute reusable environments**.  
- composition:
  - `VM` `image`
  - `Vagrantfile` - `base` `configuration` that is merged with the consuming project's `Vagrantfile`
