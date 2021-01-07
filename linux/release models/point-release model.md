# point-release / standard model 

- Think of this as a release branches model with each branch getting patches applied (hence backports) while future dev happens in subsequent branches


[ ] TODO setup example of branching here 

- FYI old releases of ubuntu listed here: http://old-releases.ubuntu.com/releases/
```mermaid

flowchart LR
  WIP TODO
  (18.04 LTS)
  groovy(18.10 IR)
  focal(19.04 IR)
  groovy(19.10 IR)

  focal(18.04 LTS)
  groovy(18.10 IR)
  focal(19.04 IR)
  groovy(19.10 IR)
  focal(20.04 LTS)
  groovy(20.10 IR)
  hirsuite(21.04 IR)


```

- ie Ubuntu Linux has multiple versions (18.04, 20.04, 20.10, 21.04, etc)
  - upstream Debian too