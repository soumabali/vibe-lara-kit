# VIBE CODING FLOW (PRD-Driven)

## Flow wajib tiap request fitur/perbaikan
1. **Intake request** dari chat
2. **Map ke requirement** di `PRODUCT_REQUIREMENTS.md`
   - jika belum ada, buat FR baru dulu
3. **Rencana implementasi ringkas**
   - impacted modules + regression path
4. **Implementasi**
5. **Quality gate** (`./scripts/quality-gate.sh`)
6. **Update docs wajib**
   - update FR status di `PRODUCT_REQUIREMENTS.md`
   - append log di `PRODUCT_CHANGELOG.md`
   - update `ARCH_DECISIONS.md` jika ada keputusan desain
   - update API spec `docs/api/openapi.yaml`
   - update DBML `docs/db/schema.dbml`
   - update flow bisnis `docs/BUSINESS_FLOW.md`
   - pastikan `README.md` / `docs/STARTERKIT.md` ikut berubah jika flow setup berubah
7. **Report hasil**
   - changed files, test result, regression result, risk sisa

## Aturan keras
- Jangan claim selesai kalau docs belum update.
- Jangan merge kalau quality gate gagal.
- Requirement adalah sumber kebenaran utama.
