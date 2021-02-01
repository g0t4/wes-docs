# openssl 3.0.0

## 3.0.0 design

- [design doc](https://www.openssl.org/docs/OpenSSL300Design.html)
- **Not supposed to be breaking changes**
  - so much as internal refactoring to support long term strategy.
- `Providers` - provide implementations of algorithms, here are the planned `providers`
  - `Default` provider - current non-legacy OpenSSL cryptographic algos
  - `Legacy` provider - older algos
  - `Engines` provider - compat layer for older engines to the new Provider model
  - `FIPS` provider
- `Operations` - method (categories IMO) like `sign`/`verify`, `encrypt`/`decrypt`, etc.

### Architecture Image (enough for now)

![](https://www.openssl.org/docs/images/ToBeComponent.png)

### FIPS

- https://www.openssl.org/docs/fips.html
