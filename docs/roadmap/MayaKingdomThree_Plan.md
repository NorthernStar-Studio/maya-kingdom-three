# Project Plan - Maya Kingdom Three

## Project Overview
- **Project:** Maya Kingdom Three
- **Proposal:** https://github.com/NorthernStar-Studio/maya-kingdom-three/blob/main/docs/marketing/MayaKingdomThree_Proposal.md
- **Created:** 2026-03-22
- **Status:** Active

## Tasks

### Phase 1: Pre-Production (Q2-Q3 2026)

| ID | Task | Role | Dependencies | Critical | Status |
|----|------|------|--------------|----------|--------|
| DES-001 | Game Design Document - Core mechanics | Hideo | None | Y | complete |
| DES-002 | Design 3 unique civ mechanics (Maya, Aztec, Inca) | Hideo | DES-001 | Y | complete |
| DES-003 | Campaign map design - 3,000 year span | Hideo | DES-001 | Y | complete |
| DEV-001 | Tech stack evaluation - cross-platform | John | None | Y | complete |
| DEV-002 | Prototype - turn-based combat system | John | DEV-001 | Y | complete |
| ART-001 | Art direction document - visual style (3D) | Yoshi | None | Y | assigned |
| ART-002 | Character/faction concept art | Yoshi | ART-001 | N | pending |
| MKT-001 | Market research - competitor analysis update | Gabe | None | N | complete |
| MKT-002 | Brand strategy - trilogy positioning | Gabe | None | N | complete |

### Phase 2: Production (Q4 2026 - Q3 2027)

| ID | Task | Role | Dependencies | Critical | Status |
|----|------|------|--------------|----------|--------|
| DEV-003 | Core engine implementation | John | DEV-002 | Y | pending |
| DEV-004 | Multiplayer netcode - prototype | John | DEV-003 | Y | pending |
| DEV-005 | Cross-platform port - PC/Switch 2 | John | DEV-003 | N | pending |
| ART-003 | UI/UX design | Yoshi | ART-001 | Y | pending |
| ART-004 | Unit models - all 3 civilizations | Yoshi | ART-002 | N | pending |
| ART-005 | Environment assets - maps/tiles | Yoshi | DES-003 | N | pending |
| DES-004 | Combat balance tuning | Hideo | DES-002 | Y | pending |
| QA-001 | Playtest plan development | Sakura | None | N | pending |
| QA-002 | Alpha testing - internal | Sakura | DEV-003 | Y | pending |
| MKT-003 | Steam page setup | Gabe | MKT-002 | N | pending |
| MKT-004 | Announce trailer production | Gabe | ART-003 | N | pending |

### Phase 3: Beta (Q4 2027)

| ID | Task | Role | Dependencies | Critical | Status |
|----|------|------|--------------|----------|--------|
| DEV-006 | Bug fixes - priority issues | John | QA-002 | Y | pending |
| DEV-007 | Performance optimization | John | DEV-005 | Y | pending |
| ART-006 | Final polish - visual assets | Yoshi | ART-004 | N | pending |
| QA-003 | Beta testing - external | Sakura | QA-002 | Y | pending |
| QA-004 | Cross-platform testing | Sakura | DEV-005 | Y | pending |
| MKT-005 | Gameplay trailer release | Gabe | MKT-004 | N | pending |
| MKT-006 | Press outreach campaign | Gabe | MKT-005 | N | pending |

### Phase 4: Launch (Q1-Q2 2028)

| ID | Task | Role | Dependencies | Critical | Status |
|----|------|------|--------------|----------|--------|
| DEV-008 | Release candidate - final build | John | QA-003 | Y | pending |
| QA-005 | Day one support - hotfixes | Sakura | DEV-008 | Y | pending |
| MKT-007 | Launch day - marketing push | Gabe | DEV-008 | Y | pending |
| MKT-008 | Community management | Gabe | MKT-007 | N | pending |

### Phase 5: Post-Launch (Q3 2028+)

| ID | Task | Role | Dependencies | Critical | Status |
|----|------|------|--------------|----------|--------|
| DEV-009 | DLC planning - additional civs | John | DEV-008 | N | pending |
| QA-006 | Post-launch bug fixes | Sakura | DEV-008 | Y | pending |
| MKT-009 | DLC marketing | Gabe | DEV-009 | N | pending |

## Critical Path Analysis

**Critical Path (Y):**
1. DEV-001 → DEV-002 → DEV-003 → QA-002 → QA-003 → DEV-008 → Launch
2. DES-001 → DES-002 → DES-003 → (parallel with DEV)
3. ART-001 → (supports ART-003 for QA-002)

**Key Dependencies:**
- Multiplayer (DEV-004) must complete before QA-003
- Cross-platform (DEV-005) must complete before QA-004
- Art assets must complete before MKT-005 trailer

## Parallelism Opportunities

- MKT-001, MKT-002 can run in parallel with DES-001, ART-001
- QA-001 can start early (plan development doesn't need code)
- MKT-003 (Steam page) can start once MKT-002 done, doesn't need art

## Notes

- Q2 2028 launch timeline is aggressive - need clear MVP scope
- Cross-platform netcode (DEV-004) is biggest technical risk
- Mobile deferred to post-launch per team feedback
- Art style TBD (2D/3D decision needed)
