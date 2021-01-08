# pacman

- [ ] TODO - distill from here as needed PRN.
  - [ ] https://wiki.archlinux.org/index.php/Pacman

## primary arguments

| short | long       |  description                           |
| ----- | ---------- | ------------------------------------- |
| -h    | --help     |                                        |
| -V    | --version  |                                        |
| -D    | --database |  ops on package database               |
| -F    | --files    |                                        |
| -Q    | --query    |  query local package database          |
| -R    | --remove   |  removing packages, groups of packages |
| -S    | --sync     |  query remote package database         |
| -T    | --deptest  |                                        |
| -U    | --upgrade  |                                        |

## common commands

- `-s` search flag
  - `pacman -Qs string` - search local database
  - `pacman -Ss string` - search sync (remote) database
- `pacman -Qet` - list explicitly installed (not deps) packages


## pacman-contrib

- `pacman -S pacman-contrib`
- `pactree package_name`
