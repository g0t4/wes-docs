# tweaks

Tweaks I've made that are worth consideration. 

TODO - much more to add here

## plugins I've used before

- [vagrant-pristine](https://github.com/fgrehm/vagrant-pristine)
  - an alias works too, someting like: `alias vrecreate='vagrant destroy -f && vagrant up'`
  - helps rapidly recreate environments which is great for testing provisioning end to end
- https://www.vagrantup.com/vmware 

## plugins I want to look into

- [vagrant-parallels 2.1.0](https://rubygems.org/gems/vagrant-parallels)
- [host /etc/host updater](https://github.com/agiledivider/vagrant-hostsupdater) - so on up/destroy an entry can be added automatically to /etc/hosts if your VM has both a hostname and a private_network interface.