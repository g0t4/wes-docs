## Providers - aka Hypervisor

- `provider` - a (intentional, well designed) leaky abstraction of hypervisors (`VirtualBox`, `Hyper-V`, `VMWare`, `docker`, etc)
  - abstraction in the sense that `vagrant` encapsulates many commonalities:
    - standardizing on config via a `Vagrantfile`!
    - configuring `memory` and `cpu` resources consistently
    - or, networking with `forwarded_port`, `private_network` and/or `public_network`
    - keep in mind each hypervisor is nuanced and not just in its naming!
  - leaky in the sense that the hypervisor is:
    - explicitly:
      - in vm config blocks in Vagrantfile
      - specified at least on initial call to vagrant up (`vagrant up --provider=virtualbox`)
      - a box is limited by the hypervisors it was built to support
    - nuanced config (lower level) like VirtualBox's `--modifyvm` flag is still available and also made explicit in the `Vagrantfile`
 
## docs & types of providers

[provider docs](https://www.vagrantup.com/docs/providers)

- [virtualbox](https://www.vagrantup.com/docs/providers/virtualbox)
- [hyperv](https://www.vagrantup.com/docs/providers/hyperv)
- [VMware](https://www.vagrantup.com/docs/providers/vmware)
- [docker](https://www.vagrantup.com/docs/providers/docker) - if you are familiar with docker-toolbox or even Docker Desktop for Mac/Windows then this will feel familiar, vagrant sets up a VM with docker and abstracts that away as if you are just working with containres as your virtualization layer
- additional providers can be installed via [provider plugins](https://www.vagrantup.com/docs/plugins/providers)

## DEFAULT PROVIDER

- `virtualbox` is the [default provider](https://www.vagrantup.com/docs/providers/default)
- You may be prompted for a provider when necessary (pulling a box that supports multiple providers/hypervisors, first call to `vagrant up` with a multi-provider box)
- Use `VAGRANT_DEFAULT_PROVIDER` env var to pre-specify the default and avoid most prompts for a provider
  - you can change the default default provider 😉
