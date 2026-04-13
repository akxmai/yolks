#!/bin/bash
set -euo pipefail

cd /home/container || exit 1

if [[ -n "${TZ:-}" && -f "/usr/share/zoneinfo/${TZ}" ]]; then
    export TZ
fi

# Pelican/Pterodactyl passes the final startup command in STARTUP.
if [[ -z "${STARTUP:-}" ]]; then
    echo "STARTUP is not set."
    exit 1
fi

echo "Container runtime: $(java -version 2>&1 | head -n 1)"
echo "Launching: ${STARTUP}"

exec /bin/bash -lc "${STARTUP}"
