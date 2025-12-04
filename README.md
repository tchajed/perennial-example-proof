# Perennial example program proof

[![CI](https://github.com/tchajed/perennial-example-proof/actions/workflows/ci.yml/badge.svg)](https://github.com/tchajed/perennial-example-proof/actions/workflows/ci.yml)

This repo demonstrates how to depend on perennial via opam and carry out a
program proof. It includes some Go code, translates it with Goose, and then
includes a proof using Perennial.

This setup demonstrates configuring Perennial using opam and CI using
[tchajed/setup-rocq](https://github.com/tchajed/setup-rocq), a new action that
will cache opam dependencies.

## Build

You will need Go 1.24+ and opam installed.

To install the Rocq dependencies, run `opam install --deps-only .`

To build, run `make`.
