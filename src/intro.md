# Introduction

- _Canonical location: <https://asaaki.github.io/mdBook-test/>_
- _GitHub repository: <https://github.com/asaaki/mdBook-test>_

---

## How this is build

### .travis.yml

```yml
language: rust
sudo: false
cache: cargo
rust: stable
os: linux

jobs:
  include:
    - stage: publish
      if: branch = master
      script: make ci
      deploy:
        provider: pages
        skip_cleanup: true
        github_token: $GITHUB_TOKEN
        local_dir: ./book
```

### Makefile (excerpt)

```makefile
book:
	@mdbook build

mdbook: ${HOME}/.cargo/bin/mdbook

${HOME}/.cargo/bin/mdbook:
	cargo install mdbook

ci: ci-publish

ci-publish: mdbook book
```