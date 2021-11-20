FROM ocaml/opam:alpine
ARG COMPILER=4.11.2+musl+static+flambda

RUN rm -rf ~/.opam && \
    opam init -c ${COMPILER}
