FROM ocaml/opam2:4.08
# FROM ocaml/opam2:alpine-3.10-ocaml-4.09 # merlin-lsif build does not support 4.09 yet

WORKDIR /build

RUN eval $(opam env) && opam repository set-url default https://opam.ocaml.org && opam update

RUN sudo chown -R $(whoami) /build

RUN eval $(opam env) && opam pin add -y merlin-lsif https://github.com/rvantonder/merlin.git\#lsif
RUN eval $(opam env) && opam pin add -y lsif-ocaml https://github.com/rvantonder/lsif-ocaml.git

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
