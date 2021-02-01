# openssl for client certificates

## Commands

### print list of accepted CAs:

- `openssl s_client -connect www.weshigbee.com:443 -prexit`

### cert inspection commands

- should I merge in `certigo` here? 

## relevant FAQs

- [How do I install a CA certificate into a browser?](https://www.openssl.org/docs/faq.html#USER12)
- [Why doesn't my server application receive a client certificate?](https://www.openssl.org/docs/faq.html#PROG13)
- [What is special about OpenSSL on Redhat?](#BUILD6)
  - RHEL7+ bundles limited openssl - disabling `IDEA`, `RC5` and `MDC2`
  - May apply to other linux distros
  TODO rest