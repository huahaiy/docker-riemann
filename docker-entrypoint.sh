#!/bin/bash
set -e

if [ "$1" = 'riemann' ]; then

  sed -ri "s/\[host \"[0-9]+.[0-9]+.[0-9]+.[0-9]+\"\]/\[host \"0.0.0.0\"\]/" /etc/riemann/riemann.config
  echo "(include \"$RIEMANN_CONFIG_INCLUDE_DIR\")" >> /etc/riemann/riemann.config

  cat /etc/riemann/riemann.config

  exec riemann "$@"
fi

exec "$@"
