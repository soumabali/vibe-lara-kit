#!/usr/bin/env bash
set -euo pipefail

TARGET_DIR=${1:-$(pwd)/runtime-app}
OVERLAY_DIR=$(cd "$(dirname "$0")/.." && pwd)

composer create-project laravel/laravel "$TARGET_DIR" "^12.0"
cd "$TARGET_DIR"
composer require laravel/sanctum filament/filament
composer require --dev pestphp/pest pestphp/pest-plugin-laravel laravel/pint larastan/larastan
php artisan install:api
php artisan pest:install

rsync -av --exclude vendor --exclude runtime-app --exclude .git "$OVERLAY_DIR/" "$TARGET_DIR/"

cp -n .env.example .env || true
php artisan key:generate

echo "Setup complete. Configure DB in .env then run:"
echo "php artisan migrate --seed"
echo "php artisan serve"
