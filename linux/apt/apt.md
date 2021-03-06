# apt-based package management tool

NOTE: both [debian.md](debian.md) and [apt.md](apt.md) are WIP - rough rough drafts and likely need to be merged 

[ ] TODO - pickup from what seems to be top level entry point to docs
- https://wiki.debian.org/PackageManagement
- 
## Terms 

- [`apt` - `Advanced Package Tool`](https://wiki.debian.org/Apt) 
- `distro` - I like to think of this as a continuously developed series of releases/repositories (packages) that comprise a particular variant of `linux` that runs on top of the `linux` `kernel`
- [`packages`](https://www.debian.org/distrib/packages)
  - sections (of packages)
    - `main` - software that's free and deps are free
    - `contrib` - software that's free but has deps that aren't
    - `non-free` - software that's not free (free = onerous licensing too)
  - `binary` / `DebianBinary` - the package contains pre-built binaries that are installed on the client
  - `source` / `DebianSource` - the package contains source code that is compiled on the client before installation
- `DebianRepository` / `repository`
  - https://wiki.debian.org/DebianRepository
  - A `repository` is simply a file organization scheme 
    - **Hosted on a network server typically**
      - ie [official Debian stable repository](https://wiki.debian.org/DebianStable)
      - could be simply on a file system too (local drive, network share, or CD/DVD, etc)
    - Adding/Removing repositories to a system adjusts the packages (and thus software) available to the system (to install, or remove, or modify)
    - `version` = `named version` = `set of (software) repositories`
      - at least one `cpu architecture`
    - `releases` are the various versions of a repository over time, in a way you can think of them as isolated but they do have temporal connection and are usually evolutions of former releases.
      - [DebianReleases](https://wiki.debian.org/DebianReleases)
        - 
      - `buster` = `Debian 10` and is the current `stable` `release` of `Debian`
        - `buster` is a `codename`
        - [DebianBuster](https://wiki.debian.org/DebianBuster)
    - Using a web browser: [`Anatomy`](https://wiki.debian.org/DebianRepository#Anatomy_of_a_repository) 
      - `repository` `root`?? folder
        - 🔑 `gpg` signature public key
          - Files are signed with the private key
          - The public key is used to verify files are not altered 
            - Take care to acquire the public key over a secure channel or it could be altered too
            - Steps to ensure safety
              - Don't download key over `http`
              - Download key over `https` 
                - But, ensure the `certificate` (public key) is valid for the `https` endpoint
              - And/or verify public key using its fingerprint (content hash) which you acquire out-of-band (ie a separate `https` site, a phone call, text message, key server, etc)
          - 📁 `dists` - contains folders for various major releases of the distro
            - Examples:
              - Ubuntu:
                - 📁 `focal` - (lts 20.04) 
                - 📁 `groovy` - 20.10 interim release
                  - `Release`
                  - `Release.gpg` -  
                - 📁 `hirsute` - 21.04 interim release
                - 
              - Debian:
                - 📁 `buster` - 
                - 📁 `jessie` - 
                - 📁 `stretch` - 
                - 📁 `wheezy` - 
              - 
    - Technical spec: [`Format`](https://wiki.debian.org/DebianRepository/Format) - technical specification
    - Example (docker repos - ubuntu): 
      - https://download.docker.com/linux/ubuntu/
  - A `repository` is a file/tree organization scheme with:
    - `packages` (`binary` and/or `source`)
    - `infrastructure files`
      - `checksums`
      - `indices` 
      - `signatures`
      - `descriptions`
      - `translations`
      - 
- `Apt-based` `PackageManagement tool` - ie `apt` or `apt-get`
  - `client` computers use these to `download` and `install` `packages`

