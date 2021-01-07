# XDG Base Directory Specification

[ ] TODO

- https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
- spec for where to look for files, by specifying 1+ base dirs to look inside.

## environment variables

- pathing:
  - paths must be absolute
  - relative path should be ignored / considered in valid

### writing user-centric files

_- relative to single base directories_

| env var            | default              | desc                                                                                                                                                                                                                                                                |
| ------------------ | -------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `$XDG_DATA_HOME`   | `$HOME/.local/share` | data files                                                                                                                                                                                                                                                          |
| `$XDG_CONFIG_HOME` | `$HOME/.config`      | config files                                                                                                                                                                                                                                                        |
| `$XDG_CACHE_HOME`  | `$HOME/.cache`       | non-essential (cache) files                                                                                                                                                                                                                                         |
| `$XDG_RUNTIME_DIR` |                      | non-essentail runtime & other files                                                                                                                                                                                                                                 |
|                    |                      | - i.e. sockets, named pipes, etc                                                                                                                                                                                                                                    |
|                    |                      | MUST be owned by user                                                                                                                                                                                                                                               |
|                    |                      | MUST have access mode 0700                                                                                                                                                                                                                                          |
|                    |                      | MUST be created on first login, destroyed after logout (of all sessions)                                                                                                                                                                                            |
|                    |                      | MUST be shared if user logs in multiple times                                                                                                                                                                                                                       |
|                    |                      | MUST not survive reboot OR full login/logout cycle.                                                                                                                                                                                                                 |
|                    |                      | MUST be on local filesystem & not shared with other systems                                                                                                                                                                                                         |
|                    |                      | MUST be fully supported by OS's standards: unix-like OS - AF_UNIX sockets, symbolic and hard links, proper permissions, file locking, sparse files, memory mapping, file change notifications, reliable hard link count, no restrictions on file name character set |
|                    |                      | files MAY be subject to periodic cleanup                                                                                                                                                                                                                            |
|                    |                      | access timestamp s/b modified once every 6 hours or the `sticky` bit set                                                                                                                                                                                            |
|                    |                      | default - (if not set) apps must print warning and fallback to replacement directory with similar capabilities                                                                                                                                                      |
|                    |                      | apps should use for communication & synchronization                                                                                                                                                                                                                 |
|                    |                      | apps should not put large files in it, since it might reside in memory and can't always be swapped out                                                                                                                                                              |

### searching for files

| env var            | default                         | desc                             |
| ------------------ | ------------------------------- | -------------------------------- |
| `$XDG_DATA_DIRS`   | `/usr/local/share/:/usr/share/` | data dirs + `$XDG_DATA_HOME`     |
| `$XDG_CONFIG_DIRS` | `/etc/xdg`                      | config dirs + `$XDG_CONFIG_HOME` |

- searched in order of list of directories
- `📁:📁:📁` colon separated

## referencing the spec

- Other specs may ref this spec, say with `$XDG_DATA_DIRS/subdir/filename`
  - file should be put in $datadir(/usr/share)/subdir/filename
- `$sysconfdir/xdg/subdir/filename` with `$sysconfdir` = `/etc/`
-
