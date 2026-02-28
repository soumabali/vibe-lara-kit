#!/usr/bin/env bash
set -euo pipefail

BASE_URL=${BASE_URL:-http://localhost:8000}

echo "[1/4] Health"
curl -fsS "$BASE_URL/health" >/dev/null

echo "[2/4] API products"
curl -fsS "$BASE_URL/api/v1/products" >/dev/null

echo "[3/4] Admin login page"
code=$(curl -s -o /dev/null -w "%{http_code}" "$BASE_URL/admin/login")
[[ "$code" == "200" || "$code" == "302" ]]

echo "[4/4] Done"
echo "✅ Smoke test passed"
