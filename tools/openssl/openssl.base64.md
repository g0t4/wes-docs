# openssl base64 encoding

- [base64](https://wiki.openssl.org/index.php/Base64)
  - page explains how base64 encoding works in openssl

## Encoding process

- Encoding 8 bit -> ASCII
- PEM base encodes
- characters mapped (in order): `[A-Za-Z0-9+/]`
  - ![](images/base64-pem.png)
- encodes groups of **3 bytes** at a time
  - padding with `=` or `==` if `1` or `2` bytes missing on last triplet
- PEM 80 characters per line
  - not a base64 limitation, rather when writing out ASCII characters it is only **80 characters per line**

## FYI other base64 encoding schemes exist

- keep in mind base64 is endless and does not care about this limit
- ie base64 `crypt()` password encryption function that uses a different base64 encoding which containers characters `[./0-9A-Za-z]` 
