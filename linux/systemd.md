WIP - find a way to organize succintly and neatly link into man pages

# systemd

- `systemd` - PID 1 `system` and `service manager`

  - instances (not invoked by users normally)
    - `system instance` -
      - PID 1
      - **starts up and maintains `userspace`**
      - symlinked to `/sbin/init`
      - `system.conf` + files in `system.conf.d`
    - `user instance` -
      - **separate instances** started per user login
      - manages the user's services
      - `user.conf` + files in `user.conf.d`
  - why?
    - **aggressive parallelization**
      - `socket & D-Bus activation` - on-demand service startup when socket accessed

- TODOs

  - [ ] https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.1.en
  - [ ] https://jlk.fjfi.cvut.cz/arch/manpages/man/user@.service.5.en
  - [ ] https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd-system.conf.5.en
  - [ ] https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.syntax.7.en
  - [ ] https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.time.7.en
  - [ ] [core man pages search](https://jlk.fjfi.cvut.cz/arch/manpages/listing/core/systemd/)

- Directives: https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.directives.7.en

### Units

- 11 Unit types (currently)
- [systemd.unit(5)](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.unit.5.en)

### Service Units

- daemon processes
- [systemd.service(5)](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.service.5.en)

### Socket Units

- [systemd.socket(5)](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.socket.5.en)
- encapsulate local IPC
  - or, network sockets
- used for socket activation
  - more about activation: [daemon(7)](https://jlk.fjfi.cvut.cz/arch/manpages/man/daemon.7.en)

### Target Units

[systemd.target(5)](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.target.5.en)

- Grouping units - provide synchronization points

### Device Units

- expose kernel devices in systemd
- can be used for device-based activation
- [systemd.device(5)](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.device.5.en)

### Mount units

- control mount points in the file system
- [systemd.mount(5)](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.mount.5.en)

### Automount units

- on-demand mounting of file systems
- [systemd.automount(5)](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.automount.5.en)

### Timer Units

- triggering other units based on timers
- [systemd.timer(5)](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.timer.5.en)

### Swap units

- similar to mount units
- encapsulate memory swap partitions or files of the OS
- [systemd.swap(5)](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.swap.5.en)

### Resource Control

- [systemd.resource-control(5)](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.resource-control.5.en)

### Timer

[systemd.timer(5)](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.timer.5.en)

### Exec

[systemd.exec(5)](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.exec.5.en)

## `systemctl`

- `systemctl` - command for managing systemd

- `systemctl --help` - help with systemctl top level itself
- `systemctl help [SUBCOMMAND]` - help with subcommand
- `systemctl status` -

## Links

- [archlinux systemd guide](https://wiki.archlinux.org/index.php/Systemd)
  - [systemctl(1)](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemctl.1)
  - [systemd(1)](https://jlk.fjfi.cvut.cz/arch/manpages/man/systemd.1.en)
