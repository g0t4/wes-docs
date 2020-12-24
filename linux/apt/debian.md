# debian

NOTE: both [debian.md](debian.md) and [apt.md](apt.md) are WIP - rough rough drafts and likely need to be merged 

## Links

- [Debian project site](https://www.debian.org/)
- [Debian wiki](https://wiki.debian.org/)

## Releases


- [Debian releases](https://wiki.debian.org/DebianReleases)
- [Debian releases info](https://www.debian.org/releases/)
- At least 3 `distributions` or `repositories/releases` at any one time
  - **I like to think of these as release branches in GitHub**
  - I see these as a package promotion pathway:
    - WIP a way to visualize the distributions (sections/suites)
    - ```mermaid
        graph LR;
          os[old stable]
          s[stable]
          t(testing)
          u(unstable)
          u --> t --> s --> os

          e(experimental)
          bp[backports]

          subgraph Current as of 2020-12-24 [current]
            c_os[old stable - Stretch]
            c_s[stable - Buster]
            c_t[testing - Bullseye]
            c_u[unstable - Sid ]
            archived[after EOL releases are archived]
            c_u -- branched --> c_t -- promoted --> c_s --> retiring --> c_os --> archived
          end      
      ```
      

  - `stable` - production quality packages
    - [Browse package in latest stable](https://packages.debian.org/stable/)
  - `testing` - packages not yet in a `stable` release 
    - queued to be included
    - why? newer versions of software (packages)
    - [Browse packages in testing](https://packages.debian.org/testing/) - which comprise what will become the next stable release
      - Right now `buster` is the `codename` for the current stable release
      - And, `testing` maps to `bullseye` which is the name of the next stable release after `buster`
  - `unstable` - active development of debian happens here, 
    - subscribe to `debian-devel-announce` mailing list for major changes
    - [Browse packages in unstable]()
  - `oldstable` - the last `stable` release
  - `backports`
  - `experimental`
- Support
  - **All releases** - **3 years**
  - `LTS` releases - **5 years**
    - [LTS docs](https://wiki.debian.org/LTS)

