#!/bin/sh

addgroup -g "$PGID" dirbit
adduser -u "$PUID" -G dirbit -D dirbit

chown -R "$PUID":"$PGID" "$APP_DIR"

umask "$UMASK"

setpriv --reuid dirbit --regid dirbit --keep-groups cyberdrop-dl "$@"

