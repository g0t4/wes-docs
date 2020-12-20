# Vagrant's multi-machine environments

One of my favorite features of Vagrant is to spin up **multiple VM environments** in seconds with heterogenous configuration. 

For example,
  - web tier with centos running kestrel
    - can even be scalable with ruby loops to spin up N servers and test really complex environments 
  - database VM with ubuntu running mongodb
    - scale too for replication and failover testing!
  - caching server with redis

## General 

- many vagrant commands take an argument to specify the name of a machine in a multi-machine configuration.
  - `vagrant ssh web` or `vagrant ssh ubuntu` ... depends on the name(s) you pass to `config.vm.define`
  - name is `default` in single machine configurations
  - each machine has a nested configuration that supports the full scope of options as a top-level / single-machine configuration supports.
    - ensure to use a dedicated name in your config for each machine's unique config so as not to accidentally configure the wrong machine or all machines!