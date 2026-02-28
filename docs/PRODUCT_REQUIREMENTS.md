# PRODUCT REQUIREMENTS (Single Source of Truth)

Dokumen utama requirement project berbasis starter kit ini.
Semua fitur baru wajib dimulai dari sini.

## Product Vision
Starter kit untuk vibe coding berbasis Laravel + Filament + API-first,
domain-agnostic (bisa dipakai untuk project apapun).

## Scope Baseline
- Auth API (Sanctum)
- Role/permission (Spatie)
- Activity log (Spatie)
- Error monitoring readiness (Sentry)
- Quality gate + docs guard
- PRD-driven flow

## Requirement Template
### FR-XXX: <Nama Requirement>
- **Tujuan:**
- **Aktor:**
- **Trigger:**
- **Input:**
- **Output:**
- **Acceptance Criteria:**
  - [ ] AC1
  - [ ] AC2
- **Edge Cases:**
- **Impact Area:** API / Admin / DB / Auth / Jobs / Cache / Docs
- **Risiko:**

## Status
- Proposed
- Approved
- In Progress
- Done
- Deprecated

### FR-CORE-ONBOARDING-CLARITY: Onboarding harus jelas (task + expected result)
- **Tujuan:** User baru langsung paham apa yang harus dikerjakan dan hasil yang diharapkan.
- **Aktor:** Programmer / tech lead.
- **Trigger:** Membuka starter kit pertama kali.
- **Input:** README + docs portal.
- **Output:** Checklist aksi jelas dan ekspektasi hasil terukur.
- **Acceptance Criteria:**
  - [x] README menjelaskan "apa yang harus dikerjakan".
  - [x] README menjelaskan "ekspektasi hasil".
  - [x] Docusaurus home/getting-started menyampaikan hal yang sama.
- **Impact Area:** Docs.
- **Risiko:** rendah.

### FR-CORE-DOCKER-COMPOSE-READY: Starter kit siap jalan via docker compose
- **Tujuan:** Trial starter kit semudah mungkin tanpa setup manual panjang.
- **Aktor:** Programmer.
- **Trigger:** Menjalankan starter kit pertama kali.
- **Input:** `docker compose up -d --build`.
- **Output:** App + DB + docs portal langsung dapat diakses.
- **Acceptance Criteria:**
  - [x] Ada `docker-compose.yml` siap pakai.
  - [x] Dokumentasi memakai compose sebagai rekomendasi utama.
  - [x] URL hasil run dicantumkan jelas.
- **Impact Area:** Infra docs + devx.
- **Risiko:** medium (tergantung docker compose tersedia di host).
