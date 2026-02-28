#!/usr/bin/env bash
set -euo pipefail

APP_CONTAINER=${APP_CONTAINER:-starter-app}
DB_CONTAINER=${DB_CONTAINER:-starter-db}

docker rm -f "$APP_CONTAINER" >/dev/null 2>&1 || true
docker rm -f "$DB_CONTAINER" >/dev/null 2>&1 || true

echo "✅ Containers removed: $APP_CONTAINER, $DB_CONTAINER"
