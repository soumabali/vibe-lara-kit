# Starter Kit Quickstart (Complex-First)

Starterkit ini fokus ke **project aplikasi**.
Docusaurus docs dipisah ke project: `projects/vibe-starterkit-docs`.

## Yang harus kamu kerjakan
1. Tulis PRD/Spec fitur.
2. Implement fitur sesuai modul.
3. Update docs wajib.
4. Jalankan quality gate.
5. Pastikan output sesuai acceptance criteria.

## Ekspektasi hasil
- Fitur jadi lebih cepat, dengan kualitas stabil.
- Semua perubahan punya jejak jelas (PRD, changelog, ADR, docs teknis).
- Project siap dikembangkan dari small ke high complexity.

---

## Cara paling mudah: Docker Compose

```bash
cd projects/vibe-starterkit
docker compose up -d --build
```

URL penting:
- App: `http://localhost:8000`
- Admin: `http://localhost:8000/admin/login`
- Swagger: `http://localhost:8000/docs/v1`

Stop service:
```bash
docker compose down
```

---

## Docusaurus docs (terpisah)
```bash
cd projects/vibe-starterkit-docs
npm install
npm run start
```
Buka: `http://localhost:3000`

## Struktur kerja modul (WAJIB untuk PRD kompleks)
- `ai/agents/core`
- `ai/agents/api`
- `ai/agents/admin`
- `ai/agents/data`
- `ai/agents/qa`
- `ai/prompts/prd`
- `ai/prompts/implementation`
- `ai/prompts/review`

## Dokumen WAJIB
- `docs/PRODUCT_REQUIREMENTS.md`
- `docs/PRODUCT_CHANGELOG.md`
- `docs/ARCH_DECISIONS.md`
- `docs/api/openapi.yaml` (wajib example request/response)
- `docs/db/schema.dbml`
- `docs/BUSINESS_FLOW.md`

## Custom Artisan Commands
- `php artisan starter:quality-gate`
- `php artisan starter:docs-guard`
- `php artisan starter:docs-regenerate v1`
- `php artisan starter:smoke-test`
