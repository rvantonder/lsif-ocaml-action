#!/bin/bash -l

set -x
echo $(pwd)
ls $(pwd)
eval $(opam env) && \
    opam pin add -y merlin-lsif https://github.com/rvantonder/merlin.git\#lsif && \
    opam pin add -y lsif-ocaml https://github.com/rvantonder/lsif-ocaml.git
echo 'Dune build...'
eval $(opam env) && \
    dune build && \
    lsif-ocaml-dump && \
    lsif-ocaml -only-type-hovers > data.lsif
