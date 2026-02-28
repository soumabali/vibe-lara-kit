# PRODUCT CHANGELOG

### 2026-02-22 02:10 — feat
- Clone dari simple-ecommerce menjadi domain-agnostic starter kit
- Hapus unsur ecommerce (model/controller/migration endpoint domain)
- Pertahankan baseline medium-high (Sanctum + RBAC + Activitylog + Sentry readiness)
- Tambah dokumentasi Docusaurus-ready

### 2026-02-22 02:45 — feat
- **Request:** Perjelas onboarding (apa yang dikerjakan + expected result) dan pastikan docker compose siap + documented
- **Requirement Ref:** FR-CORE-ONBOARDING-CLARITY, FR-CORE-DOCKER-COMPOSE-READY
- **Perubahan:** tambah docker-compose.yml, ubah README + STARTERKIT + Docusaurus home/getting-started jadi compose-first
- **File terdampak:** docker-compose.yml, README.md, docs/STARTERKIT.md, docs-portal/docs/home.md, docs-portal/docs/getting-started.md
- **Migration:** no
- **Test:** docs build
- **Regression check:** docs route + instructions consistency
- **Breaking change:** no

---
