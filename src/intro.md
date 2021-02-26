# Introduction

- _Canonical location: <https://asaaki.github.io/mdBook-test/>_
- _GitHub repository: <https://github.com/asaaki/mdBook-test>_

---

## How this is build (simplified)

### .github/workflows/ci.yml

```yml
name: "[CI] Publish to GH Pages"

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

env:
  MDBOOK_BIN: /home/runner/toolbin/mdbook

jobs:
  build:
    runs-on: ubuntu-20.04
    steps:
    - uses: actions/checkout@v2

    - name: Setup mdBook
      uses: peaceiris/actions-mdbook@v1
      with:
        mdbook-version: 'latest'

    - name: Build
      run: mdbook build

    - name: Deploy
      uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./book

```
