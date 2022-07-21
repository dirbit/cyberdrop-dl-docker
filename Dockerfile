FROM python:3.10-alpine

ENV VERSION 2.27.4

ENV APP_DIR="/app" PUID="1000" PGID="1000" UMASK="022"

RUN apk add --no-cache setpriv

RUN python3 -m pip install --no-cache-dir --upgrade pip && \
    python3 -m pip install --no-cache-dir cyberdrop-dl==${VERSION}

WORKDIR ${APP_DIR}

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

