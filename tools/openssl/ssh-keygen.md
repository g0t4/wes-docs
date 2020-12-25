# ssh-keygen command 

## ssh key - generation

- Generates SSH v2 keys 
  - Default OpenSSH-specific format
    - Allows storing comment in private key file too
- Comments 
  - default: use@host
  - are useful to identify the key (if say the public and private key pair files have been separated - comment is a way to link them)
- `-m (RFC4716|PKCS8|PEM)`
  - what key file format to write
- 

```shell

# no args: generates rsa key
ssh-keygen

# generic options:
-f filename 
  # generated key file
  # defaults: 
    # private key: ~/.ssh/id_(rsa|dsa|ecdsa|ed25519) 
    # public key: [private key].pub (.pub is appended)

# rsa  
ssh-keygen -t rsa -b 4096
  # -b 4096 = key has 4k bits (decimal equivalent of >1233 digits!)
    # default is 3072
    # minimum is 1024

# dsa - must be 1024 bits
ssh-keygen -t dsa 

# ecdsa 
ssh-keygen -t ecdsa 
  # -b - one of three elliptic curve sizes (256, 384, or 521 bits)

# ed25519
ssh-keygen -t ed25519
  # -b ignored b/c this is a fixed length key

# provide comment
-C COMMENT

```



## key modification


```shell
-p # modify passphrase
  -N new_passphrase
-c # modify comment


# showing fingerprints of keys
-E md5 
-E sha256 # this is the default
-l # print fingerprint 
-f filename # key file

# options geared towards hashing hostnames in known_hosts
# search for hostname in known_hosts file (especially useful when hashing hostnames)
-F hostname[:port] # port is optional
# hash all non-hashed hostnames (ignore already hashed names)
-H 
```

### ssh key management

### ssh key conversions

### known_hosts

- `R hostname[:port]` modifies the known_hosts file to remove all matching entries by the provided hostname

## Certificates
- `-L` print contents of certificate

## Diffie-Hellman group exchange (DH-GEX)
- TODO LATER
### generating DH-GEX

## Key Revocation Lists (KRLs)
- TODO LATER
- `-k` generate a KRL file
- `-f` specifies KRL file
- every passed keyfile is added

### generating KRLs
### updating KRLs
### testing KRLs (key revocation)

