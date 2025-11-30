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

go tool goose -out "$GOOSE_OUTPUT" -dir . ./...
go tool proofgen -out "$PROOFGEN_OUTPUT" -dir . \
  -configdir "$GOOSE_CONFIG_DIR" ./...
