# get.docker.com convenience scripts

**TLDR**: scripts to automate the install of docker engine (linux)

- Scripts:
  - <https://get.docker.com> (defaults to stable build)
  - <https://test.docker.com> (defaults to test build)
- [docker/docker-install source](https://github.com/docker/docker-install)
- [docs on using convenience scripts](https://docs.docker.com/engine/install/ubuntu/#install-using-the-convenience-script)

## Options (arguments to the script)

- _Hint: review the script too, to find the latest options!_
- variables
  - `$CHANNEL`
    - `test` - builds of next stable release
    - `stable` - current "solid" release
    - `nightly` - daily builds of the `master` branch (development branch) with warts and all!
    - `edge` (deprecated)
  - `$DOWNLOAD_URL`
  - `$REPO_FILE` - override `docker-ce.repo`
- script arguments
  - `--mirror [URL]` - (see code for latest mirrors)
  - `--dry-run` - toggle dry-run mode (don't apply changes)

## **WARNINGS**

- YES for dev/testing
- **NOT for production**

### Review the script(s), why:

- Learn how they work
  - Nuances you might otherwise overlook
- So you can port it to another `CM` tool like an `ansible` `playbook`
- Identify and fix bugs (submit `PRs` to help others)
- Is the script safe?
  - Always use `HTTPS` to download the script
    - [miim attacks](https://en.wikipedia.org/wiki/Man-in-the-middle_attack)
  - AND, does the script itself use secure transports?
    - Find `http:` only:
      - `curl -fsSL https://get.docker.com | grep -i 'http:'`
    - Find `https` only:
      - `curl -fsSL https://get.docker.com | grep -i 'https:'`
  - Is it relaxing tls verification anywhere?
  - Will it **conflict** with your existing environment configuration
    - Even in a containerized world it's easy to find tools that install conflicting dependencies
      - (:joy: 'twas not long ago that python2 vs 3 was a thing :smile:)

### Test the script!

- Ideally, in a `sandbox` / `throw away environment`
  - Perhaps, a VM :wink:
- **These require `sudo`** escalated privileges
  - Another reason to review carefully
- Consider using a `checksum` to ensure the version you download is what you reviewed
  - Download checksums over `https` too...
  - Yes, this means you'll have to review updates, that is the point!
    - But not a full review, use a diff versus the last release you reviewed...
    - OR, even better:
    - Don't forget this is [versioned on github](https://github.com/docker/docker-install)
    - Which means you can do commit by commit review of latest changes!
