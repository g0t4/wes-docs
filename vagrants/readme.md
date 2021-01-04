# vagrants

My thoughts about `vagrant` (a tool I 💖), especially for learning!

## Sections

- [`vagrantfile`](./vagrantfile.md)
- [`snapshots`](./snapshots.md)

## Vagrant terms

- `provider` - a (intentional, well designed) leaky abstraction of hypervisors (`VirtualBox`, `Hyper-V`, `VMWare`, `docker`, etc)
  - abstraction in the sense that `vagrant` encapsulates many commonalities:
    - standardizing on config via a `Vagrantfile`!
    - configuring `memory` and `cpu` resources consistently
    - or, networking with forwarded_port, private_network and/or public_network
  - leaky in the sense that the hypervisor is:
    - explicitly:
      - specified at least on initial call to vagrant up (`vagrant up --provider=virtualbox`)
      - a box is limited by the hypervisors it was built to support
      - in vm config blocks in Vagrantfile
    - nuanced config (lower level) like VirtualBox's `--modifyvm` flag
  - additional providers can be installed via [provider plugins](https://www.vagrantup.com/docs/plugins/providers)
- `provisioner` - configuration management to predictably and automatically tailor a VM to your needs beyond what is provided in the `box` which can be thought of as a starting point.
- Links:
  - [vagrant](https://www.vagrantup.com/)
  - [Vagrant Cloud box search](https://app.vagrantup.com/boxes/search)
    - [centos org](https://app.vagrantup.com/centos)
      - [centos/8 box](https://app.vagrantup.com/centos/boxes/8)
    - [generic org](https://app.vagrantup.com/generic) - lots of great boxes
  - [providers (hypervisors)](https://www.vagrantup.com/docs/providers)
    - [virtualbox](https://www.vagrantup.com/docs/providers/virtualbox)
  - [provisioning](https://www.vagrantup.com/docs/provisioning)
    - [shell scripts](https://www.vagrantup.com/docs/provisioning/shell)
      - options:
        - [inline](https://www.vagrantup.com/docs/provisioning/shell#inline) for [heredocs](https://ruby-doc.org/core-2.5.0/doc/syntax/literals_rdoc.html#label-Here+Documents)
        - [path](https://www.vagrantup.com/docs/provisioning/shell#path) relative to the `Vagrantfile`
    - [ansible overview](https://www.vagrantup.com/docs/provisioning/ansible_intro)
      - [ansible](https://www.vagrantup.com/docs/provisioning/ansible) executed on host to configure guest
      - [ansible_local](https://www.vagrantup.com/docs/provisioning/ansible_local) executed on `self-configuring` guest - think ansible's local connection type

## Performance tips/considerations:

- You can disable checking for box updates for speed's sake
  - Normally, every time `vagrant up` the box is checked and the user is warned if there's a newer **box**
  - Disable with env var `VAGRANT_BOX_UPDATE_CHECK_DISABLE=1`
  - Add to Vagrantfile: `config.vm.box_check_update = false`
  - To manually update boxes:
    - `vagrant box outdated`
    - `vagrant box update --box FOO`
      - `vagrant box update` within a vagrant project (ie next to Vagrantfile) to update boxes used by project.
