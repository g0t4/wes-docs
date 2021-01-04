# provisioners

##







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