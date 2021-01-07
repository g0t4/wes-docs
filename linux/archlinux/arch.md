# arch

**Goal is to provide latest stable version of most software using a [rolling-release](https://en.wikipedia.org/wiki/Rolling_release) model.**

- <https://archlinux.org>
- [wiki](https://wiki.archlinux.org)
- [news](https://archlinux.org/news/)

## Packages

- [Arch Packaging Standards](https://wiki.archlinux.org/index.php/Arch_Packaging_Standards)
- [Package updates feed](https://archlinux.org/feeds/packages/)
- Official Packages
  - x86-64 optimized
  - [Packages](https://archlinux.org/packages)
- [AUR - archlinux user repository](https://aur.archlinux.org)
  - Community packages (AUR) compliments official packages
  - [AUR Package Search](https://aur.archlinux.org/packages/)

## Principles

- [Simplicity](https://wiki.archlinux.org/index.php/Arch_Linux#Simplicity)
  - ship software as released by upstream (original developers) w/ minimal distro-specific (downstream) changes
    - downstream patches are almost entirely backported bug fixes
    - upstream config files preserved too - mostly system file path changes
    - doesn't add automation features like enabling a service simply because the package was installed
  - GUI config utils are not officially provided, **shell is emphasized for system config**
- [Modernity](https://wiki.archlinux.org/index.php/Arch_Linux#Modernity)
  - Basically one release with continuous updates (like is proposed with CentOS Stream)
  - _I think this model is fantastic - less time wasted maintaining older versions, easier upgrade paths for those that want to upgrade_
  - Modern features:
    - `systemd` init system
    - modern filesystems
    - LVM2
    - software RAID
    - udev support
    - initcpio ([mkinitcpio](https://wiki.archlinux.org/index.php/Mkinitcpio))
    - latest kernel builds
- [Pragmatism](https://wiki.archlinux.org/index.php/Arch_Linux#Pragmatism)
  - yes! get rid of the politics, make open-source and proprietary available so people can chose what they want
    - Amen! (proprietary for those that **embrace functionality over ideology!!**)
  - case by case basis for deviations from goals based on needs of a package and its maintainers
- [User centrality](https://wiki.archlinux.org/index.php/Arch_Linux#User_centrality)
  - `user-centric` - designed for those that contribute to it
    - versus `user-friendly` which is what many other distros design for, to try to appeal to broad audiences
  - `arch` targeted at proficient GNU/Linux users & people w/ do-it-yourself mentality (read docs, problem solvers)
  - `Archers` contribute packages freely to the `AUR`, improve `wiki`, interact w/ community
- [Versatility](https://wiki.archlinux.org/index.php/Arch_Linux#Versatility)
  - `general-purpose distro` - post install is just a CLI
    - instead of removing unwanted packages, add just what you want
  - [`pacman`](https://wiki.archlinux.org/index.php/Pacman) - one command to upgrade anything and everything
  - [`Arch Build System` ](https://wiki.archlinux.org/index.php/Arch_Build_System)- ports-like system to build & install from source
    - beyond `AUR` there are 1000s of community contributed PKGBUILD scripts for compiling from source using [makepkg](https://wiki.archlinux.org/index.php/Makepkg)
  - Users can easily host own package repositories

## History

_Summary of [History](https://wiki.archlinux.org/index.php/Arch_Linux#History):_

- 2001 - Judd Vinet starts development on Arch in 2001 (inspired by simplicity but disappointed with lack of package management)
- 2002 Mar - Arch Linux v0.1 released March 11, 2002
- 2005 - ArchWiki born in July 2005
- 2007 - Aaron Griffin took over for Judd in 2007
- 2012 Jul - menu-driven AIF (Arch Installation Framework) deprecated
  - Replaced by Arch Install Scripts
  - [arch-install-scripts](https://archlinux.org/packages/?name=arch-install-scripts)
- 2013 - System V init system replaced by systemd
- 2017 - drop support for i686
- 2020 - Aaron Griffin steps down, process for election and election held to replace him with Levente Polyak
