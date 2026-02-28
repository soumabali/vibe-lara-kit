# ARCHITECTURE DECISIONS (ADR Lite)

Catat keputusan teknis penting supaya tidak hilang konteks.

## ADR Template
### ADR-XXX: <Judul>
- **Tanggal:**
- **Status:** proposed/accepted/superseded
- **Context:**
- **Decision:**
- **Consequences:**
- **Alternatives considered:**
- **Related Requirement:** FR-XXX

---

### ADR-001: Quality Gate wajib sebelum merge
- **Tanggal:** 2026-02-22
- **Status:** accepted
- **Context:** butuh stabilitas tinggi dan minim bug/crash
- **Decision:** lint + analyse + test + migrate pretend wajib jalan
- **Consequences:** lead time sedikit lebih panjang, kualitas naik signifikan
- **Alternatives considered:** testing manual tanpa gate
- **Related Requirement:** FR-CORE-QUALITY
