# openssl Glossary

- `plaintext` - user readable (ie a letter with english text is plaintext)
- `ciphertext` - encoded data, not user readable hopefully ;)
- algorithms:
  - `encryption` - `ciphertext` = `encryption`(`plaintext`)
  - `decryption` - `plaintext` = `decryption`(`ciphertext`)
  - `hash` - one way `encryption` that can't be `decrypted` (not easily)
  - `key` - used by `encryption`/`decryption` to do its business
