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
       dev \
    && echo 'dev ALL=(ALL:ALL) NOPASSWD:ALL' > /etc/sudoers.d/dev \
    && chmod 440 /etc/sudoers.d/dev \
    && chown root:root /etc/sudoers.d/dev \
    && sed -i.bak 's/^Defaults.*requiretty//g' /etc/sudoers
USER dev
RUN opam init -a -y
RUN opam switch 4.06.0+flambda
RUN opam install depext
ENTRYPOINT [ "opam", "config", "exec", "--" ]
CMD [ "bash" ]
