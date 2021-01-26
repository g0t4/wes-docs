# TOML - Tom's Obvious Minimal Language

- [toml.io](https://toml.io/en)
  - Well designed docs, best reference is just to use this site.
  - [full v1.0.0 spec](https://toml.io/en/v1.0.0)
- [gh toml-lang]
  - [toml.io source](https://github.com/toml-lang/toml/blob/1.0.0/toml.abnf)
  - [toml](https://github.com/toml-lang/toml)
  - [grammar](https://github.com/toml-lang/toml/blob/1.0.0/toml.abnf)

## notes

- configuration file format
- subjective goals _(note: subjective goals != mission accomplished )_
  - easily machine and human readable
  - map unambiguously to a hashtable (no top level arrays or other primitives)
  - easy to parse into data structures in many languages
- case-sensitive, UTF-8 encoded Unicode document
- unique
  - tables
