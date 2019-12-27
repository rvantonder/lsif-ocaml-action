#!/bin/bash -l -x

echo $(pwd)
ls $(pwd)
echo 'Doing opam'
opam pin add -y merlin-lsif https://github.com/rvantonder/merlin.git\#lsif
opam pin add -y lsif-ocaml https://github.com/rvantonder/lsif-ocaml.git
echo 'Dune build...'
opam exec -- dune build
opam config exec -- lsif-ocaml-dump
opam config exec -- lsif-ocaml -only-type-hovers > dump.lsif
