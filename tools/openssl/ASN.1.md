# ASN.1 Abstract Syntax Notation objects

VERY ROUGH WIP - needs cleaned up I was distracted when doing this.

- _Most of my notes are from [ASN.1 walkthrough](https://www.obj-sys.com/asn1tutorial/asn1only.html)_
  - [ ] TODO find other sources
- `Abstract Syntax Notation One` - in `OSI model`
  - `Application Layer`
    - **data types**
    - and **structures**
  - `Presentation Layer`
    - **encoding** is deferred to the `Presentation Layer`
  - `ASN` - think high level programming language composing simple types into complex types
  - `abstract syntax` -
  - `transfer syntax` -
- `OID` = `object identifier`
  - [dotted numeric format of underlying types](https://www.obj-sys.com/asn1tutorial/node10.html#asn1_simple_section)
- [`ASN.1`](https://www.obj-sys.com/asn1tutorial/node1.html)
  - A means of defining types using numbers to represent sequences of types (`OID`)
- [`Modules`](https://www.obj-sys.com/asn1tutorial/node6.html)
  - module has the name `oid_section` which points at a section name that contain `NVPs` of `OIDs`
- this is some means of defining types / aliasing them from what I can ascertain in samples
  - likely to partition config and for NVPs that have nested NVPs that are of a specific format (hence OID?)
- `ASN.1`
  - `--comments--` or `--commentsEOL`
  - `module`
    - name a `data specification`
    - (optional) OID
    - a collection of:
      - `type definition` - declare & name via `type assignment`
      - `value definition` - declare & name via `value assignment`
      - each `type / value assignment` must be delineated by a `newline`
  - [`type assignment`](https://www.obj-sys.com/asn1tutorial/node7.html)
    - format: `name ::= type` (space delimited)
      - `::=` reads `"is defined as"`
    - `name` = `type reference`
      - chars: `alphanumeric` and `-` characters)
      - start with `[A-Z]` only
      - not end with `-`
      -
  - `value assignment`
    - has `value reference` (`name`), `value type`, `::=` and `valid value notation`
  - `built-in types` = (`simple` and `structured`)
    - `structured types` = `component types` (each is a `simple type` or `structured type`)
    - [`simple types`](https://www.obj-sys.com/asn1tutorial/node10.html)
      > |                   | tag |                                                              |
      > | ----------------- | --- | ------------------------------------------------------------ |
      > | BOOL              | 1   |                                                              |
      > | INTEGER           | 2   |                                                              |
      > | BIT STRING        | 3   | binary data arbitrary length (Binary or Hex representation ) |
      > |                   |     | - Binary ends with `B`                                       |
      > |                   |     | - Hex ends with `H`                                          |
      > | OCTET STRING      | 4   | " length is multiple of 8                                    |
      > |                   |     | - Binary/Hex `B`/`H` applies here too                        |
      > | NULL              | 5   |                                                              |
      > | OBJECT IDENTIFIER | 6   | name info objects?                                           |
      > | REAL              | 9   | numeric                                                      |
      > | ENUMERATED        | 10  | 3+ states (else whats the point, its a BOOLEAN or SCALAR)    |
      > | CHARACTER STRING  | \*  | chars from a specified charset                               |
    - Full list of [Universal Types](https://www.obj-sys.com/asn1tutorial/node124.html)
      - TODO distill https://www.obj-sys.com/asn1tutorial/node124.html
  - `user-defined type` = `simple types` or `structured types`
  - `useful types` = defs for small number of commonly used types
  -
