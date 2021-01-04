# vagrants

My thoughts about `vagrant` (a tool I 💖), especially for learning!

## Sections

- [`vagrantfile`](./vagrantfile.md) - declarative / configuration as code approach to defining environments (machine(s))
- [`snapshots`](./snapshots.md) - point in time captures of the entire state of the VM! (or machine)
- [`provisioners`](./provisioners.md) - aka configuration management
- [`providers`](./providers.md) - aka hypervisors

## Links

- [vagrant](https://www.vagrantup.com/)
- [docs](https://docs.vagrantup.com/)
- <https://github.com/hashicorp/vagrant>
  - Source code is highly readable, take for example the ansible_local provisioner's code to ensure the ansible controller is installed on the guest!
  - Source code is the golden version of the truth even if it is not as concise as well written docs. Spelunk the code, I always feel so much better than when I just read docs and try to remember esoteric explanations that I often find are out of date when I just grab the code and read through it. And then I like to do something with said source, like modify it or build something on top of it to demonstrate what I think it is doing and verify IIUC.

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
