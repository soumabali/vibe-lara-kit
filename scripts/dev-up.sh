#!/usr/bin/env bash
set -euo pipefail

APP_CONTAINER=${APP_CONTAINER:-starter-app}
DB_CONTAINER=${DB_CONTAINER:-starter-db}
DB_NAME=${DB_NAME:-starter_db}
DB_USER=${DB_USER:-postgres}
DB_PASS=${DB_PASS:-postgres}
APP_PORT=${APP_PORT:-8000}

# PostgreSQL
if ! docker ps -a --format '{{.Names}}' | grep -q "^${DB_CONTAINER}$"; then
  docker run -d --name "$DB_CONTAINER" \
    -e POSTGRES_DB="$DB_NAME" \
    -e POSTGRES_USER="$DB_USER" \
    -e POSTGRES_PASSWORD="$DB_PASS" \
    postgres:16-alpine
else
  docker start "$DB_CONTAINER" >/dev/null
fi

# App container (composer image with php)
docker rm -f "$APP_CONTAINER" >/dev/null 2>&1 || true
docker run -d --name "$APP_CONTAINER" \
  --link "$DB_CONTAINER":db \
  -p "$APP_PORT":8000 \
  -v "$(pwd)":/app \
  -w /app \
  composer:2 \
  sh -lc 'php artisan serve --host=0.0.0.0 --port=8000'

echo "✅ App: http://localhost:${APP_PORT}"
echo "✅ Admin: http://localhost:${APP_PORT}/admin/login"
