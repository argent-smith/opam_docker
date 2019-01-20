FROM arm64v8/alpine:3.8 as build-opam

RUN apk add -U --no-cache \
        alpine-sdk \
        bash \
        m4 \
        git \
        ocaml \
        ocaml-findlib \
        ocaml-ocamlbuild \
        ocaml-compiler-libs \
    && rm -rf /var/cache/apk/*

WORKDIR /work
RUN git clone -b 2.0.2 --depth=1 https://github.com/ocaml/opam.git
WORKDIR /work/opam
RUN git checkout -b 2.0.2
RUN ./configure \
    && make lib-ext \
    && make \
    && make install

FROM arm64v8/alpine:3.8

COPY --from=build-opam /usr/local/bin/opam /usr/local/bin/opam
COPY --from=build-opam /usr/local/share/man/man1/opam* /usr/local/share/man/man1/
RUN apk add -U --no-cache \
        alpine-sdk \
        bash \
        m4 \
        git \
        xz \
        rsync \
    && rm -rf /var/cache/apk/*

RUN addgroup -S dev \
    && adduser \
       -S \
       -D \
       -G dev \
       dev \
    && echo 'dev ALL=(ALL:ALL) NOPASSWD:ALL' > /etc/sudoers.d/dev \
    && chmod 440 /etc/sudoers.d/dev \
    && chown root:root /etc/sudoers.d/dev \
    && sed -i.bak 's/^Defaults.*requiretty//g' /etc/sudoers
USER dev

WORKDIR /home/dev
RUN opam init -a -y --disable-sandboxing --compiler=4.07.1 \
    && opam clean

ENTRYPOINT [ "opam", "config", "exec", "--" ]
CMD [ "bash" ]
