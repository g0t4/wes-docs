# Vagrant's multi-machine environments

One of my favorite features of Vagrant is to spin up **multiple VM environments** in seconds with heterogenous configuration.

For example,

- web tier with centos running kestrel
  - can even be scalable with ruby loops to spin up N servers and test really complex environments
- database VM with ubuntu running mongodb
  - scale too for replication and failover testing!
- caching server with redis

## multi-machine wortwhile options to know

- [primary](https://www.vagrantup.com/docs/multi-machine#specifying-a-primary-machine) 
  - instead of applying to all machines, no machine name(s) triggers the primary target (machine) as the "default" in this case
  - `vagrant up/ssh/halt/reload` etc all apply to the primary if no machine name is passed after the subcommand
- [autostart](https://www.vagrantup.com/docs/multi-machine#autostart-machines) 
  - on `vagrant up` you can disable a machine from being created with `autostart: false` as an argument to `define`
  - then it will only start up with an explicit reference to it `vagrant up foonotrightaway`.

## Networking matters

- Networking matters if you want the VMs to communicate
- Use `private_network` on the same subnet `192.168.30.X` to ensure communications. 
  - `private_network` doesn't expose these VMs to my network
- `public_network` can be used judiciously
  - be aware it opens the VMs up to access by anyone on your `intranet`! 

## Looping for multi-machines

- A `Vagrantfile` is `ruby` code that is executed to `build up` a `configuration object` which describes the `desired state` for vagrant to enforce.
  - So, exploit the `imperative benefits` of `configuration as code` to rapidly create complex configs with `loops` and `variable` `interpolation` and anything in the ruby language your heart desires!
- Ranges: `2..5` is a range
- GOTCHA to avoid with looping: `for...in` vs `.each`
  - https://www.vagrantup.com/docs/vagrantfile/tips#loop-over-vm-definitions
  - do use `(1..3).each do |i| ... end`
    - not `for i in 1..3`
    - nuance of scoping of variables and when interpolation happens
    - has to do with lazy-loading (deferred) of multi-machine and provider overrides

## General

- many vagrant commands take an argument to specify the name of a machine in a multi-machine configuration.
  - `vagrant ssh web` or `vagrant ssh ubuntu` ... depends on the name(s) you pass to `config.vm.define`
  - name is `default` in single machine configurations
  - each machine has a nested configuration that supports the full scope of options as a top-level / single-machine configuration supports.
    - ensure to use a dedicated name in your config for each machine's unique config so as not to accidentally configure the wrong machine or all machines!

# How multi-machine environments change command usage:

TLDR: `vagrant` needs to know what VMs you are targeting

- some commands can operate on all machines
- `vagrant up/halt/restart/reload/destroy`
  - or a subset (down to one) of machines
  - `vagrant up foo`
- many require an argument to target one or more machines
  - `vagrant up foo bar # but not baz`
  - some only take a single machine (vagrant ssh)
  `vagrant ssh bar`
  - doesn't make sense to ssh into two machines 
    - (ok maybe it would be nice to split open separate terminals :wink:.. put that aside#
- it's largely intuitive which commands take all, a subset, or one machine
- you can target subsets too with [regex]https://www.vagrantup.com/docs/multi-machine#controlling-multiple-machines
