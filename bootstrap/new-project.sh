#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <new-project-dir> [app-name]"
  exit 1
fi

SRC_DIR=$(cd "$(dirname "$0")/.." && pwd)
TARGET_DIR=$(realpath -m "$1")
APP_NAME=${2:-"Vibe Starter App"}

mkdir -p "$TARGET_DIR"

rsync -a \
  --exclude vendor \
  --exclude node_modules \
  --exclude storage/logs/* \
  --exclude bootstrap/cache/* \
  --exclude .git \
  --exclude docs-portal/node_modules \
  --exclude docs-portal/build \
  "$SRC_DIR/" "$TARGET_DIR/"

cd "$TARGET_DIR"
cp -n .env.example .env || true
sed -i "s/^APP_NAME=.*/APP_NAME=\"$APP_NAME\"/" .env || true
mkdir -p bootstrap/cache storage/framework/{cache,sessions,views} storage/logs

echo "✅ New starter project created at: $TARGET_DIR"
echo "Next:"
echo "1) composer install"
echo "2) php artisan key:generate"
echo "3) php artisan migrate --seed"
echo "4) php artisan starter:quality-gate"
