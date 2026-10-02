#!/bin/sh
set -e

# If BACKEND is provided without a domain (e.g. from Render's internal host 'opengym-api-t3sl'),
# append .onrender.com so it resolves via public DNS.
if [ -n "$BACKEND" ]; then
  case "$BACKEND" in
    *.*) ;;
    *) BACKEND="${BACKEND}.onrender.com" ;;
  esac
  export BACKEND
fi

exec /docker-entrypoint.sh "$@"
