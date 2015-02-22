#!/bin/bash
set -e

if [ "$1" = 'riemann' ]; then

  sed -ri "s/127.0.0.1/0.0.0.0/" /etc/riemann/riemann.config
  echo "(include \"$RIEMANN_CONFIG_INCLUDE_DIR\")" >> /etc/riemann/riemann.config

  cat /etc/riemann/riemann.config

  exec riemann /etc/riemann/riemann.config
fi

exec "$@"
