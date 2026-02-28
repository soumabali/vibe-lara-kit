# Business Flow

Starter kit ini tidak mengikat domain bisnis tertentu.
Flow default hanya fondasi auth + admin access + documentation-driven development.

## Flow Default
1. Tulis / update PRD di `docs/PRODUCT_REQUIREMENTS.md`.
2. Implement fitur sesuai scope PRD.
3. Jalankan `php artisan starter:quality-gate`.
4. Update docs wajib:
   - `docs/api/openapi.yaml`
   - `docs/db/schema.dbml`
   - `docs/BUSINESS_FLOW.md`
5. Generate bundle dokumentasi:
   - `php artisan starter:docs-regenerate v1`

## Authentication & Authorization
- Auth API: Laravel Sanctum (wajib)
- Role/permission: Spatie Laravel Permission
- Admin panel: Filament dengan kontrol akses role/permission

## Observability
- Activity log: Spatie Activitylog
- Error monitoring: Sentry via env

## Performance Rule
- Hindari N+1 query
- Gunakan eager loading
- Batasi kolom SELECT seperlunya
