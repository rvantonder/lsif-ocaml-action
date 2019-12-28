#!/bin/bash -l

set -x
echo $(pwd)
ls $(pwd)
whoami
echo $PATH
echo 'Dune build...'
eval $(/usr/bin/opam env) && \
    dune build && \
    lsif-ocaml-dump && \
    lsif-ocaml -only-type-hovers > data.lsif
