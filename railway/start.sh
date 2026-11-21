#!/bin/sh
# Railway volumes mount as root: make /data usable by the image's muse user, then drop privileges.
set -e
mkdir -p "${NANOMUSE_DATA_DIR:-/data}" "${NANOMUSE_WORKSPACE:-/data/workspace}"
chown -R muse:muse "${NANOMUSE_DATA_DIR:-/data}" 2>/dev/null || true
exec setpriv --reuid=1000 --regid=1000 --init-groups env HOME=/home/muse nanomuse "$@"
