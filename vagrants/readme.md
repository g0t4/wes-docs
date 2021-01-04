# vagrants

My thoughts about `vagrant` (a tool I 💖), especially for learning!

## Sections

- [`vagrantfile`](./vagrantfile.md)
- [`snapshots`](./snapshots.md)

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
  - [provider docs](https://www.vagrantup.com/docs/providers)
    - [virtualbox](https://www.vagrantup.com/docs/providers/virtualbox)
      - `virtualbox` is the [default provider](https://www.vagrantup.com/docs/providers/default)
      - You may be prompted for a provider when necessary (pulling a box that supports multiple providers/hypervisors, first call to `vagrant up` with a multi-provider box)
        - Use `VAGRANT_DEFAULT_PROVIDER` env var to pre-specify the default and avoid most prompts for a provider
    - [hyperv](https://www.vagrantup.com/docs/providers/hyperv)
    - [VMware](https://www.vagrantup.com/docs/providers/vmware)
    - [docker](https://www.vagrantup.com/docs/providers/docker) - if you are familiar with docker-toolbox or even Docker Desktop for Mac/Windows then this will feel familiar, vagrant sets up a VM with docker and abstracts that away as if you are just working with containres as your virtualization layer
    - additional providers can be installed via [provider plugins](https://www.vagrantup.com/docs/plugins/providers)

## Provisioner - a mechanism of installing and/or configuring software

- `provisioner` - configuration management to predictably and automatically tailor a VM to your needs beyond what is provided in the `box` which can be thought of as a starting point.
  - The box too was once `provisioned` so `provisioning` can be thought of as layered or hierarchical.
- [docs](https://www.vagrantup.com/docs/provisioning), and a few provisioners I use in courses:
  - [shell scripts](https://www.vagrantup.com/docs/provisioning/shell)
    - easiest (no other tools to worry about just the fun that is shell script syntax 😉)
    - options:
      - [inline](https://www.vagrantup.com/docs/provisioning/shell#inline) 
        - [heredocs](https://ruby-doc.org/core-2.5.0/doc/syntax/literals_rdoc.html#label-Here+Documents)
      - [path](https://www.vagrantup.com/docs/provisioning/shell#path)
        - relative to the `Vagrantfile`
  - [ansible overview](https://www.vagrantup.com/docs/provisioning/ansible_intro)
    - [ansible](https://www.vagrantup.com/docs/provisioning/ansible) 
      - executed on host to configure guest
    - [ansible_local](https://www.vagrantup.com/docs/provisioning/ansible_local) 
      - executed on `self-configuring` guest - local connection type
      - the guest is both the controller and the managed node

## Docs / project site

- [vagrant](https://www.vagrantup.com/)
- [docs](https://docs.vagrantup.com/)

## Finding boxes with `Vagrant Cloud`

- [Vagrant Cloud box search](https://app.vagrantup.com/boxes/search)
  - [centos org](https://app.vagrantup.com/centos)
    - [centos/8 box](https://app.vagrantup.com/centos/boxes/8)
  - [generic org](https://app.vagrantup.com/generic) - lots of great boxes

## Performance tips/considerations:

- You can disable checking for box updates for speed's sake
  - Normally, every time `vagrant up` the box is checked and the user is warned if there's a newer **box**
  - Disable with env var `VAGRANT_BOX_UPDATE_CHECK_DISABLE=1`
  - Add to Vagrantfile: `config.vm.box_check_update = false`
  - To manually update boxes:
    - `vagrant box outdated`
    - `vagrant box update --box FOO`
      - `vagrant box update` within a vagrant project (ie next to Vagrantfile) to update boxes used by project.
