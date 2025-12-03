# Perennial example program proof

[![CI](https://github.com/tchajed/perennial-example-proof/actions/workflows/ci.yml/badge.svg)](https://github.com/tchajed/perennial-example-proof/actions/workflows/ci.yml)

This repo demonstrates how to depend on perennial via opam and carry out a
program proof. It includes some Go code, translates it with Goose, and then
includes a proof using Perennial.

The most interesting part of this setup is that it supports CI with caching of
opam dependencies. The usual approach to Rocq CI of using
[rocq-community/docker-coq-action](https://github.com/rocq-community/docker-coq-action)
makes this difficult because the build runs in Docker and the `~/.opam` of the
container is not shared with the runner. Instead, this CI setup uses setup-ocaml
directly. This does mean that OCaml and Rocq are compiled, but this is mitigated
with opam caching: compiling those from scratch takes about 10min, while a
cached build where nothing has changed is about 1min.

## Build

You will need Go 1.24+ and opam installed.

To install the Rocq dependencies, run `opam install --deps-only .`

To build, run `make`.
