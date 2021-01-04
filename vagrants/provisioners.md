# provisioners - for installing and/or configuring software (aka Configuration Management)

- `provisioner` - configuration management to predictably and automatically tailor a VM to your needs beyond what is provided in the `box` which can be thought of as a starting point.
  - The box too was once `provisioned` so `provisioning` can be thought of as layered or hierarchical.
- [docs](https://www.vagrantup.com/docs/provisioning), and a few provisioners I use in courses:

## provisioner types

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

## Thoughts on organization of provisioner(s)

- splitting provisioning affords:
  - efficient development (run one at a time)
  - especially helpful if not idempotent
  - troubleshooting after developed
  - updating when things change (like apt-key add deprecation)

- file provisioner
  - `config.vm.provision "file"`
  - this is convenient but does couple you to vagrant 
    - Not a problem for a learning environment
    - And if it is for more, then consider a more robust provisioner
      - like a shell script 
      - or even better an idempotent ansbile playbook! 
      - oh and refactor to this as needed, avoid BUFD