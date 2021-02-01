# trust stores

- Mozilla (at least was) aggressively curating a trust store (albeit in a proprietary format) that can be converted to PEM
  - `curl` hosts this converted:
    - http://curl.haxx.se/docs/caextract.html
      - Actual link:
        - https://curl.se/ca/cacert.pem
      - PEM format
    - File only updated once every few months so don't hammer curl, once daily at most is requested.
      `curl --remote-name --time-cond cacert.pem https://curl.se/ca/cacert.pem`
    - Can also extract from local Firefox install via `certutil`
      - from apt package `libnss3-tools`