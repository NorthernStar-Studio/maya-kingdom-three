# DEV-006A — Implementation Estimate

**Milestone:** v0.6.0  
**Branch:** release/v0.6.0  
**Date:** March 19, 2026  
**Status:** Draft

---

## 1. Executive Summary

This document provides effort, timeline, and resource estimates for the **Emotion Cards Implementation** milestone (DEV-006A). The scope covers completing the core card system for Ember, Maya, and Wren, integrating card effects into combat, adding save/load persistence, and performing QA pass.

**Total Estimated Effort:** 88 hours  
**Estimated Timeline:** 4-6 weeks (depending on velocity and parallelization)  
**Resource Requirements:** 1-2 engineers, QA support

---

## 2. Effort Estimates

### 2.1 Core Card System

| Task | Description | Hours |
|------|-------------|-------|
| CARD-001 | Implement Ember card effects (20 cards) | 8 |
| CARD-002 | Implement Maya card effects (20 cards) | 8 |
| CARD-003 | Implement Wren card effects | 8 |
| CARD-004 | Emotion family system (Warmth, Shadow, Fire, Storm) | 6 |
| CARD-005 | Maya Reflection mechanic | 4 |
| CARD-006 | Maya Comfort/Reframe mechanics | 4 |
| **Subtotal** | | **38** |

### 2.2 Combat Integration

| Task | Description | Hours |
|------|-------------|-------|
| COMBAT-001 | Wire card effects into CombatGameplayLoop | 4 |
| COMBAT-002 | Status effect system (Weak, Vulnerable, etc.) | 6 |
| COMBAT-003 | Energy/Emotion Capacity system | 4 |
| COMBAT-004 | Turn-based card play flow with UI | 6 |
| **Subtotal** | | **20** |

### 2.3 Save/Load

| Task | Description | Hours |
|------|-------------|-------|
| SAVE-001 | Persist active card effects across encounters | 4 |
| SAVE-002 | Deck state for run progression | 4 |
| **Subtotal** | | **8** |

### 2.4 QA & Polish

| Task | Description | Hours |
|------|-------------|-------|
| QA-001 | Character-specific smoke tests | 4 |
| QA-002 | Balance pass on starter decks | 8 |
| QA-003 | Card art placeholders | 2 |
| **Subtotal** | | **14** |

### 2.5 Buffer (contingency)

| Item | Hours |
|------|-------|
| Integration issues / refactoring | 8 |
| **Total with Buffer** | **88** |

---

## 3. Timeline Estimates

### 3.1 Assumptions
- Team has 1-2 engineers available for implementation
- QA can run in parallel with development
- No major blockers from dependencies
- Average velocity: 12-16 hours/week per engineer

### 3.2 Phased Timeline

| Phase | Duration | Focus | Deliverables |
|-------|----------|-------|--------------|
| **Sprint 1** | 1-1.5 weeks | Ember cards + basic combat wiring | CARD-001, COMBAT-001 |
| **Sprint 2** | 1-1.5 weeks | Maya cards + Reflection/Comfort | CARD-002, CARD-005, CARD-006 |
| **Sprint 3** | 1 week | Wren cards + emotion families | CARD-003, CARD-004 |
| **Sprint 4** | 1 week | Save/load + status effects | SAVE-001, SAVE-002, COMBAT-002, COMBAT-003 |
| **Sprint 5** | 0.5-1 week | UI integration + polish | COMBAT-004, QA-003 |
| **Sprint 6** | 1 week | QA pass + balance + smoke tests | QA-001, QA-002 |

**Estimated Total: 5-7 weeks**

---

## 4. Resource Needs

### 4.1 Personnel
| Role | Allocation | Notes |
|------|------------|-------|
| Engineer (primary) | 100% | Card system implementation, combat integration |
| Engineer (secondary) | 25-50% | Code review, QA support, save/load |
| QA | 50% | Smoke tests, balance pass |

### 4.2 Technical Dependencies
- **Completed (v0.5.0):**
  - CardManager with config wiring
  - Character effect handlers with apply_config()
  - CombatGameplayLoop with config propagation
  - DamageEngine foundation
- **In Scope (v0.6.0):**
  - Full card effect implementation
  - Status effect system
  - Save/load for card state
  - UI integration

### 4.3 External Dependencies
- None required for implementation
- Character designs exist in GDD docs

---

## 5. Risk-Adjusted Estimates

| Scenario | Impact | Adjustment |
|----------|--------|------------|
| Card balance requires iteration | +8-16 hours | Add 2 sprints for balance |
| Emotion family logic complexity | +4-8 hours | Add buffer to CARD-004 |
| UI integration delays | +4-8 hours | Extend COMBAT-004 |

**Worst Case:** ~112 hours (6-8 weeks)

---

## 6. Release Criteria (from Milestone)

- [ ] Ember has 20+ playable cards with functional effects
- [ ] Maya has 20+ playable cards with Reflection/Comfort/Reframe mechanics
- [ ] Wren has playable card kit
- [ ] Emotion family resonance triggers on 3+ cards from same family
- [ ] Cards can be played, resolved, and discarded in combat
- [ ] Deck persists across encounters
- [ ] Basic smoke tests pass for all three characters
- [ ] No game-breaking bugs in card play flow

---

## 7. Out of Scope

- Narrative integration
- Complex transmutation
- Achievement/unlock system
- Full UI polish
- Multiplayer/co-op
- End-game breakthrough states

---

**Prepared by:** John  
**Git identity:** John <john@northernstar.studio>
