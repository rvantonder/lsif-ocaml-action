#!/bin/bash -l

set -x
echo $(pwd)
ls $(pwd)
whoami
echo $PATH
export PATH=/home/opam/.opam/4.09/bin:/usr/bin$PATH
eval $(/usr/bin/opam env) && \
    /usr/bin/opam pin add -y merlin-lsif https://github.com/rvantonder/merlin.git\#lsif && \
    /usr/bin/opam pin add -y lsif-ocaml https://github.com/rvantonder/lsif-ocaml.git
echo 'Dune build...'
eval $(/usr/bin/opam env) && \
    dune build && \
    lsif-ocaml-dump && \
    lsif-ocaml -only-type-hovers > data.lsif
