# Github action Test

## Yaml File 
path: `.github/workflows/ruby.yml`

```
name: Ruby

on: [push, pull_request]

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v1
    - name: Set up Ruby 2.6
      uses: actions/setup-ruby@v1
      with:
        ruby-version: 2.6.x
    - name: Build and test with Rake
      run: |
        gem install bundler
        sudo apt-get install libsqlite3-dev
        bundle install --jobs 4 --retry 3
        bundle exec rake
```
