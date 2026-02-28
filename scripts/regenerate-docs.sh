#!/usr/bin/env bash
set -euo pipefail

VERSION=${1:-v1}
BUILD_DIR="docs/build/${VERSION}"

mkdir -p "$BUILD_DIR" docs/api docs/db

# Snapshot dari codebase saat ini
php artisan route:list --except-vendor > "$BUILD_DIR/routes.snapshot.txt"
php artisan migrate --pretend > "$BUILD_DIR/migration-plan.snapshot.sql" || true

# Bundle artefak docs utama (source of truth)
cp docs/api/openapi.yaml "$BUILD_DIR/openapi.yaml"
cp docs/db/schema.dbml "$BUILD_DIR/schema.dbml"
cp docs/BUSINESS_FLOW.md "$BUILD_DIR/business-flow.md"

# Metadata build
cat > "$BUILD_DIR/manifest.txt" <<EOF
version=${VERSION}
generated_at=$(date -Iseconds)
openapi=docs/api/openapi.yaml
dbml=docs/db/schema.dbml
business_flow=docs/BUSINESS_FLOW.md
EOF

./scripts/docs-guard.sh

echo "✅ Docs regenerated"
echo "Bundle: $BUILD_DIR"
