# openssl config

Why use files?

- VCS / history
- avoid CLI arguments
- reuse

## openssl - which config file(s) are used?

- `master` default (unless overridden) config file
- `-config` argument
- `OPENSSL_CNF` env var

### config file format

> Distilled from [config files](https://www.openssl.org/docs/man1.1.1/man5/config.html)

- `[default]` - `first section`
  - before any explicit section
  - often `unnamed`
- `[SECTION_NAME]`
  - starts with line after `[SECTION_NAME]`
  - includes everything up to the `next section` or `EOF`
- `section` `lookup` `precedence`
  - search for a name begins in `explicit sections`
  - `unnamed`, `default section` is searched last
- `[ENV]` special section
  - map of environment variables
  - read & write
- `#comments`

### Name=Value Pairs

- Each section is comprised of 0+ `NVP`s aka `KVP`s
- `Name`
  - characters allowed: alphanumeric and `.,;_`
  - ends at `=`
- `Value`
  - all characters after `=` until `EOL` (`end of line`)
  - whitespace is trimmed (both ends)
  - `variable expansion` - on `values`
    - shell style `$foo` and `${foo}`
    - sub other section values `$section::foo` or `${section::foo}`
      - ie `$ENV:foo`
  - 64k character limit
  - escaping characters
    - `\"'` are all valid for escaping characters
    - multi line strings when last character of a line is `\`
      - like w/ shell scripting
    - `\n`, `\r`, `\b`, `\t` all recognized

### includes

- `.include <FILE|DIR>` -
- if path is `DIR` then include all `.cnf` and `.conf` files
- `recursive inclusion` NOT allowed - files in an included directory can only include files (not subsequent directories)
- path should be **absolute** 
  - relative paths are based on the calling application's `CWD`
- for backwards compat - you can use `include = file_path` thus it appears as a KVP
- `expansion` and `escaping` apply to `includes` just like they do `values` interpolation
