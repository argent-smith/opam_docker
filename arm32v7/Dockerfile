# -*- mode: dockerfile; -*-
FROM arm32v7/debian:stretch-slim
RUN apt-get update \
    && apt-get install -y \
       opam \
       m4 \
    && apt-get autoremove \
    && apt-get clean
RUN addgroup dev \
    && adduser \
       --system \
       --disabled-login \
       --disabled-password \
       --ingroup dev \
       dev
USER dev
RUN opam init -a -y
RUN opam switch 4.05.0+flambda
ENTRYPOINT [ "opam", "config", "exec", "--" ]
CMD [ "bash" ]
