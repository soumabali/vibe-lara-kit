# Engineering Standards (Vibe Coding Guardrails)

## Wajib tiap fitur baru
1. Definisikan scope + acceptance criteria + edge case.
2. Tambah migration (jika schema berubah), jangan edit migration historis.
3. Tambah/ubah unit/feature test + regression test flow terkait.
4. Jalankan quality gate:
   - `composer lint`
   - `composer analyse`
   - `composer test`
5. Verifikasi endpoint/page kritikal tidak break.

## Tooling
- Static analysis: Larastan (`composer analyse`)
- Formatter: Pint (`composer lint`)
- Test: Pest/Laravel (`composer test`)
- CI: `.github/workflows/ci.yml`
- Pre-commit hook: `.githooks/pre-commit`

## Security baseline
- Authentication API wajib Laravel Sanctum
- Authorization wajib Role/Permission (Spatie Permission)
- Request validation wajib (FormRequest untuk endpoint penting)
- Rate limit aktif untuk API + login
- Header `X-Request-Id` aktif untuk tracing
- Secret hanya di `.env`

## Observability baseline
- Activity audit log wajib untuk entity penting (Spatie Activitylog)
- Error monitoring siap pakai via Sentry env config

## Performance baseline
- Eager loading wajib untuk endpoint dengan relasi
- Hindari N+1 query (strict mode non-production aktif)
- Query select kolom seperlunya pada endpoint list

## Merge Gate Policy
- Wajib buka PR (no direct push ke main/master).
- CI `quality` harus hijau sebelum merge.
- PR wajib centang checklist di `.github/pull_request_template.md`.
- Pre-push hook akan menjalankan quality gate otomatis.

## Documentation Contract (Wajib)
Setiap perubahan fitur/perbaikan bug WAJIB update:
- `docs/PRODUCT_REQUIREMENTS.md` (status / AC / FR baru)
- `docs/PRODUCT_CHANGELOG.md` (entry perubahan)
- `docs/ARCH_DECISIONS.md` (jika ada keputusan desain/arsitektur)
- `docs/api/openapi.yaml` (Swagger source)
- `docs/db/schema.dbml` (DBML untuk dbdocs)
- `docs/BUSINESS_FLOW.md` (alur bisnis)

Endpoint dokumentasi wajib tersedia:
- `/docs/v1`
- `/docs/v1/openapi.yaml`
- `/docs/v1/dbml`
- `/docs/v1/business-flow`

## Definition of Done
Feature dianggap selesai hanya jika:
- test + analyse + lint hijau
- regression path terkait diuji
- perubahan/risiko terdokumentasi di PR
- product docs sudah diupdate
