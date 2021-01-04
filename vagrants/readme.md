# vagrants

My thoughts about `vagrant` (a tool I 💖), especially for learning!

## Sections

- [`vagrantfile`](./vagrantfile.md)
- [`snapshots`](./snapshots.md)
- [`provisioners`](./provisioners.md)
- [`providers`](./providers.md)

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
