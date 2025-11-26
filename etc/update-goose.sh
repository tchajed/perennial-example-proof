#!/bin/bash

set -eu

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

usage() {
  echo "Usage: $0"
  echo
  echo "Runs goose on outputs to src/..."
}

# run from repository root
cd "$DIR/.."

GOOSE_OUTPUT=src/code
GOOSE_CONFIG_DIR=src/code
PROOFGEN_OUTPUT=src/generatedproof

go run github.com/goose-lang/goose/cmd/goose@new \
  -out "$GOOSE_OUTPUT" -dir . ./...
go run github.com/goose-lang/goose/cmd/proofgen@new \
  -out "$PROOFGEN_OUTPUT" -configdir "$GOOSE_CONFIG_DIR" -dir . ./...
