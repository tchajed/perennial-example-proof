#!/bin/bash

function gen_rocq_project() {
  cat _RocqProject
  find src -name "*.v"
}

proj_file=_RocqProject.install
makefile=Makefile.rocq

gen_rocq_project >"$proj_file"
rocq makefile -f "$proj_file" -docroot Perennial -o "$makefile"

make -j1 -f "$makefile" install

## cleanup
rm -f "$proj_file" \
  "$makefile" "$makefile.conf" "$makefile.local" ".${makefile}.d" \
  .filestoinstall
