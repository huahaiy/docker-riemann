#!/bin/bash
set -e

sed -ri "s/[host \"d+.d+.d+.d+\"]/[host \"0.0.0.0\"]/" /etc/riemann/riemann.config
echo "\(include \"$RIEMANN_CONFIG_INCLUDE_DIR\"\)" >> /etc/riemann/riemann.config
echo "\(logging/init {:file \"$RIEMANN_LOG_DIR/riemann.log\"}\)" >> /etc/riemann/riemann.config

/etc/init.d/riemann restart

