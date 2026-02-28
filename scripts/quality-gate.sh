#!/usr/bin/env bash
set -euo pipefail

echo "[1/7] Migration dry-run"
php artisan migrate --pretend > /tmp/migrate-pretend.log

echo "[2/7] Lint"
composer lint

echo "[3/7] Static analysis"
composer analyse

echo "[4/7] Run tests"
composer test

echo "[5/7] Docs guard (OpenAPI + DBML + Business Flow)"
./scripts/docs-guard.sh

echo "[6/7] Snapshot routes"
php artisan route:list > /tmp/routes.txt

echo "[7/7] Done"
echo "Quality gate passed."
