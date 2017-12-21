# -*- mode: dockerfile; -*-
FROM arm64v8/alpine:3.7
RUN apk add -U --no-cache \
        alpine-sdk \
        bash \
        opam \
        m4 \
        git \
        mercurial \
    && rm -rf /var/cache/apk/*
RUN addgroup -S dev \
    && adduser \
       -S \
       -D \
       -G dev \
       dev
USER dev
RUN opam init -a -y
RUN opam switch 4.06.0+flambda
RUN opam install depext
ENTRYPOINT [ "opam", "config", "exec", "--" ]
CMD [ "bash" ]
