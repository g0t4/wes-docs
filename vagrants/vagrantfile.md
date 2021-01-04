# `Vagrantfile`

- [`Vagrantfile`](https://www.vagrantup.com/docs/vagrantfile)
- `ruby` syntax - config as code which affords great flexibility
- **describes machines**
  - attributes like `hostname`
  - `provider(s)` - resources like `cpus` and `ram`
  - `provisioners` - installing/configuring software, configuring OS
    - **largely** desired state reconciliation
      - you declare `what` and vagrant takes care of `how`, if your VM has 512MB ram and you declare 1GB in your Vagrantfile in a `provider` block then vagrant will reconcile that on the next `vagrant reload`
    - `imperative` aspects too:
    - `vagrant destroy` is a command and thus `imperative`
      - in `Ansible` (CM tool) you might describe what isn't `present` (aka `absent`)
      - with machines you decide when they are started (`vagrant up`), stopped (`vagrant halt`), absent (`vagrant destroy`)

## `VAGRANT_HOME`

- `~/.vagrant.d` - default user level data directory for vagrant
  - `~/.vagrant.d/boxes` has a subdirectory per box pulled `vagrant box pull`
  - change with `VAGRANT_HOME` env var

## Coalescing configurations

- Vagrant is designed to coalesce multiple `Vagrantfile` configs into a final state... so it has to have a mechanism to merge said configs
- Spend a little time ensuring you understand loading order / precedence within and across `Vagrantfile`s

### WITHIN a SINGLE `Vagrantfile`:

- multiple `vagrant.configure` blocks are merged

### ACROSS Vagrantfiles located in different spots based on purpose:

- [load order](https://www.vagrantup.com/docs/vagrantfile#load-order)
  - box has bundled `Vagrantfile`, for example:
    - `~/.vagrant.d/boxes/ubuntu-VAGRANTSLASH-focal64/20201210.0.0/virtualbox/Vagrantfile`
    - `~/.vagrant.d/boxes/centos-VAGRANTSLASH-8/2011.0/virtualbox/Vagrantfile`
  - `~/.vagrant.d/` so you can provide user level defaults
  - project's `Vagrantfile`
    - vagrant climbs up the directory stack until it finds the first `Vagrantfile` which represents the project's `Vagrantfile`
  - [multi machine overrides](https://www.vagrantup.com/docs/multi-machine/)
  - [Provider-specific overrides](https://www.vagrantup.com/docs/providers/configuration)
