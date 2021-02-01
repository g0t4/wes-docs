# openssl Glossary

- https://github.com/openssl/openssl/blob/master/doc/man7/openssl-glossary.pod


## Some of my own adaptations of official definitions:

- `plaintext` - user readable (ie a letter with english text is plaintext)
- `ciphertext` - encoded data, not user readable hopefully ;)
- algorithms:
  - `encryption` - `ciphertext` = `encryption`(`plaintext`)
  - `decryption` - `plaintext` = `decryption`(`ciphertext`)
  - `hash` - one way `encryption` that can't be `decrypted` (not easily)
  - `key` - used by `encryption`/`decryption` to do its business
  - `symmetric cryptography` - both `encryption` and `decryption` use the same `key`
  - `asymmetric cryptogrpahy` - `encryption` and `decryption` do not use the same key, rather they use a keypair (typically `public key` and `private key`)
    - aka `public-key cryptography`
  - operations (what can be done with `crypto`)
    - A `encrypts` a `plaintext` message using B's `public-key`
    - B `decrypts` the `ciphertext` from A using B's `private-key`
    - A can `sign` a `plaintext` message using A's `private-key`
    - Anyone can `verify` the `ciphertext` signature with A's `public-key` -- this doesn't mean anything about the identity of A as an attacker could've stolen a `key` and be impersonating them.
- `PEM` - `Privacy-Enhanced Mail` format