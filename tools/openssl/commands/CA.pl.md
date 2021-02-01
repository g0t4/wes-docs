# `CA.pl` openssl perl script wrapper

- perl wrapper script for `openssl`
- **to simplify commmon certificate operations**

- I've found this useful just to read how it uses underlying `openssl` commands... 
  - Found a copy `https://github.com/openssl/openssl/blob/master/apps/CA.pl.in`

## Source for this rocks

- https://github.com/openssl/openssl/blob/master/apps/CA.pl.in

## relevant FAQs

- [FAQ's "How do I create certificates or certificate requests?"](https://www.openssl.org/docs/faq.html#USER4)
  - This is how I stumbled on CA.pl
  > Check out the CA.pl(1) manual page. This provides a simple wrapper round the 'req', 'verify', 'ca' and 'pkcs12' utilities. For finer control check out the manual pages for the individual utilities and the certificate extensions documentation (in ca(1), req(1), and x509v3_config(5) ).
- [How can I create DSA certificates?](https://www.openssl.org/docs/faq.html#USER7)
- [Why can't I create certificate requests?](https://www.openssl.org/docs/faq.html#USER5)

## Prominent operations

### `-newcert`

TODO

## getting help

- `man CA.pl`
