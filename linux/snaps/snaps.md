# snaps

## History / high-level status

- `Snap` is a software packaging and deployment system
- Developed by `Canonical`
  - Released Dec 2014
  - Originally just for Ubuntu Core, later expanded:
    - Runs on systems using the `Linux kernel`
    - Depends on features of `systemd` and is thus constrained
- Imagine a `cross-distro app store` (platform & tooling) 
  - Independent of a distro's package management system.
    - Not per-se to bypass the distro's, rather to compliment it!
    - For example, Ubuntu recommends using snap for 3rd party apps that update on a frequent basis or cadence that doesn't align well with Ubuntu's. 
  - snaps are an alternative/compliment to `apt` and `yum`
- There are a ton of similarities to the Docker platform
  - `Docker images` or `OCI compliant images` are similar to `snaps` in many ways
    - Snaps are a bundled filesystem using [SquashFS](https://en.wikipedia.org/wiki/SquashFS), images IMO are best thought of as a bundled filesystem too. And both snaps and images are compressed. They both contain applications inside.
  - `Docker` allows you to find, pull, install, and run software easily and isolated by default
    - The same is true of `snaps`, in fact the apps in the filesystem of the snap run in a container too!
    - One difference, from how I see it, major too... is that docker is always front and center when using it to manage resources--pull images, creating, running and stopping containers, and even executing additional apps in the container. And the same is true of docker-compose. 
      - Docker-compose is a slightly higher abstraction in that you have your environment configuration encoded in a docker-compose.yml file. But you would still need aliases or another means to avoid using docker-compose to interact with the resultant containerized apps. 
        - Obviously once the app is running the docker tooling slides into the background until it's time to change the app's running conditions (ie stop, restart, etc) 
      - I see snap as very similar but adding another layer of abstraction such that you move up the heirarch of tooling, in a way hiding the fact that snap is involved in many cases. 
      - For example, apps in the snap are linked to the host filesystem as if they were installed there and you can even execute them but they're just pointers to snap that marshalls your interactions into the appropriate container. 
      - With docker/docker-compose, the container is front and center... you can use a patch work of shell aliases to make apps look "native" when they're really running in a container (too) but at the end of the day you have to make the aliases to tuck away the lower layers of how you're installing and using an app via a container whereas this behavior is baked into snap installation. 
      - Snaps also work beyond CLI and server apps. They work for GUI apps. Sure you can do that with Docker if you get into the weeds but it's not for every day people to do.
      - Anyways the fact that snap is used to install an app and then it looks like it's work is done when in fact its always mediating behind the scenes. 
      - TLDR: Snap gives you a hybrid of both traditional package management (seems there just for installs and updates) and the image/container movement. Thus making it more of a universal Linux app store / package manager / app manager (might be the better word)!

## Terms

- Users can search and browse `snaps`
  - install `snaps` 
  - run the bundled apps 
  - and it looks like the apps are installed traditionally when they're actually containerized. 
- `snaps`
  - self-contained applications
  - no external dependencies (they're bundled with the snap)
  - they run sandboxed (in a container)
  - snapcraft self-identifies as ["a [universal] app store for Linux"](https://snapcraft.io/)
- `snapd` - the background service that manages and maintains snaps (downloading, installing, running, stopping, etc)
  - Very much like what Docker does with images and containers
- OCI `image` ~= `snap`
  - I like to think of this as an analogy.

## Important Links

- [Docs](https://snapcraft.io/docs)
  - [About page](https://snapcraft.io/about)
  - [Wikipedia page for Snap (package manager)](https://en.wikipedia.org/wiki/Snap_(package_manager))
- [Bugs](https://bugs.launchpad.net/snapcraft)
- [Code](https://github.com/snapcore/snapcraft) on GitHub
  - Formerly on [launchpad](https://launchpad.net/snapcraft)
  - [snapcore GitHub org](https://github.com/snapcore)
- Articles
  - [Ubuntu Core and Snappy](https://lwn.net/Articles/630660/)
    - I'm a fan of [lwn.net](https://lwn.net/)
## Terms

- `Snap store` - 
  - Users (consumers)
    - search / browse snaps
    - download
    - install
    - auto update (you can put this on hold but inevitably apps will update automatically after 60 days hold max)
      - Normally apps download updates in the background and update 
  - Publishing your own snaps
    - `snapcraft` is used to build and publish snaps
    - [building automatically is free on snapcraft.io](https://snapcraft.io/build)
      - i.e. from a GitHub repository
      - when you push changes, new snaps are built for all distros
  - `Snap store` ~= `Docker Hub`
      - when you are ready you can promote the snap through a series of channels (i.e. beta -> candidate -> stable)
- [How to install support for snaps](https://snapcraft.io/docs/installing-snapd)