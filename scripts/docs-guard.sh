#!/usr/bin/env bash
set -euo pipefail

required_files=(
  "docs/api/openapi.yaml"
  "docs/db/schema.dbml"
  "docs/BUSINESS_FLOW.md"
)

for f in "${required_files[@]}"; do
  [[ -f "$f" ]] || { echo "❌ Missing required doc: $f"; exit 1; }
done

grep -q "^openapi:" docs/api/openapi.yaml || { echo "❌ Invalid OpenAPI file"; exit 1; }
grep -q "example:" docs/api/openapi.yaml || { echo "❌ OpenAPI wajib punya field example"; exit 1; }
grep -q "Table users" docs/db/schema.dbml || { echo "❌ DBML seems incomplete"; exit 1; }
grep -q "# Business Flow" docs/BUSINESS_FLOW.md || { echo "❌ Business flow doc invalid"; exit 1; }

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  changed_code=$(git diff --name-only HEAD -- app routes database | wc -l || true)
  changed_docs=$(git diff --name-only HEAD -- docs/api/openapi.yaml docs/db/schema.dbml docs/BUSINESS_FLOW.md | wc -l || true)

  if [[ "$changed_code" -gt 0 && "$changed_docs" -eq 0 ]]; then
    echo "❌ Code berubah tapi API/DBML/BUSINESS_FLOW docs belum diupdate."
    echo "   Update: docs/api/openapi.yaml, docs/db/schema.dbml, docs/BUSINESS_FLOW.md"
    exit 1
  fi
fi

echo "✅ Docs guard passed"
