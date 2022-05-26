FROM python:3.9-alpine

ENV VERSION 2.22.4

ARG USER=user
ARG UID=1000
ARG GID=1000

WORKDIR /app

ENV PIP_NO_CACHE_DIR=1

RUN addgroup -g ${GID} ${USER} && \
    adduser -u ${UID} -G ${USER} -D ${USER} && \
    chmod -R 777 /app && \
    python3 -m pip install cyberdrop-dl==${VERSION}

USER ${USER}

ENTRYPOINT [ "cyberdrop-dl" ]
