# monero.dart

## Versioning

For monero_c (which is a wrapper around monero code and uses version schema similar to upstream) version v0.18.3.1 we do the following:

| v0  | 18  |  3  |  1  |
| --- | --- | --- | --- |
|     | 018 | 003 | 001 |

Which makes us the version:

`018003001`

then we take the number of commits using `git rev-list --count HEAD)`. So highest version is always the newest version as well. Then we join them.

## Usage

```bash
$ dart pub add monero --hosted-url=https://git.mrcyjanek.net/api/packages/mrcyjanek/pub/
```

## Building

```bash
$ make wallet2_api_c.h
$ make lib/src/generated_bindings.g.dart
$ # you are done, this is a library, what more did you expect?
```