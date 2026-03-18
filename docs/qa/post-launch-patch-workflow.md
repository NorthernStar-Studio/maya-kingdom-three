# Post-Launch Patch Workflow — Emotion Cards

**Branch:** `release/v0.5.0`  
**Purpose:** Keep post-launch bugfixes small, fast, and low-risk.

---

## 1. What This Workflow Is For

Use this when a live issue is reported after launch and we need to decide:
- how serious it is
- whether it belongs in the next patch
- what the safest fix path is
- how we verify it before pushing

This is intentionally lightweight. It is not a full live-ops system.

---

## 2. Bug Intake Rules

Every reported bug should be logged in a short, repeatable format:

- **Summary:** one-line description
- **Build/branch:** where it was seen
- **Area:** combat, cards, progression, UI, save/load, encounter, platform
- **Severity:** blocker / critical / major / minor
- **Frequency:** always / common / rare / unknown
- **Player impact:** what the player loses or cannot do
- **Repro steps:** short numbered list
- **Expected result**
- **Actual result**
- **Evidence:** screenshot, clip, log, save file if available
- **Owner:** who is fixing or verifying
- **Decision:** patch now / hold for later / needs more info

Use `docs/qa/post-launch-triage-template.md` for quick logging.

---

## 3. Severity Guide

### Blocker
Ship-stopping or progression-stopping.

Examples:
- crash on startup or during core gameplay
- corrupted save or save loss
- player cannot finish a run due to broken state
- softlock that requires force quit

**Default action:** hotfix immediately.

### Critical
Core system works incorrectly and meaningfully harms play.

Examples:
- cards apply wrong effects or costs
- combat state breaks win/lose flow
- rewards or unlocks fail consistently
- severe performance hitch in normal runs

**Default action:** include in next patch unless risk is unusually high.

### Major
Noticeable bug, but game remains playable.

Examples:
- visual state desync that confuses the player
- wrong values in UI
- uncommon but reproducible interaction bug
- missing content hookup with workaround

**Default action:** patch if fix is low-risk.

### Minor
Polish, clarity, or low-impact issue.

Examples:
- typo
- small animation/layout issue
- non-blocking audio hiccup
- edge-case cosmetic inconsistency

**Default action:** batch with other low-risk fixes.

---

## 4. Prioritization Rules

When deciding what goes into a patch, sort by this order:

1. **Player harm** — does it block progress, saves, or core combat?
2. **Repro confidence** — can QA reliably trigger it?
3. **Fix scope** — can we keep the change small?
4. **Regression risk** — does the fix touch central systems?
5. **Visibility** — will many players hit it quickly?

### Good Patch Candidates
- isolated fixes
- clear repro
- narrow code/data surface
- easy smoke test
- no broad refactor required

### Bad Patch Candidates
- speculative cleanup
- balance redesign disguised as bugfix
- large architecture changes
- bundled unrelated fixes
- “while we’re here” refactors

If a bug needs a risky rewrite, document it and move it out of the patch.

---

## 5. Patch Decision Matrix

| Severity | Repro Confidence | Fix Risk | Action |
|---|---|---:|---|
| Blocker | High | Any | Patch now |
| Critical | High | Low/Medium | Patch next |
| Critical | Low | High | Investigate first |
| Major | High | Low | Patch if bundle stays small |
| Major | Low | Any | Hold unless player volume rises |
| Minor | Any | Low | Bundle with safe fixes |

---

## 6. Practical Patch Loop

### Step 1 — Triage
- log the report
- reproduce it on `release/v0.5.0`
- assign severity and patch decision

### Step 2 — Isolate the Fix
- work on `release/v0.5.0`
- keep fix targeted to the broken behavior
- avoid cleanup unless required for correctness

### Step 3 — Verify Locally
- confirm original repro is fixed
- run the focused smoke checklist in `tests/qa/post-launch-smoke-checklist.md`
- test one adjacent case to catch obvious regressions

### Step 4 — Record the Change
For each bugfix, capture:
- files changed
- root cause
- player-facing result
- tests performed
- any remaining known limitation

### Step 5 — Push Small
- stage only intended files
- use a patch-scoped commit message
- push to `release/v0.5.0`

---

## 7. Patch Guardrails

Do this:
- keep patches small and reviewable
- prefer one fix per commit when practical
- document repro before editing code
- verify save/load when touching progression
- verify turn flow when touching combat
- verify card cost/effect/targeting when touching card logic

Avoid this:
- mixing docs, feature work, and bugfix code in one patch
- rewriting shared systems without a live issue tied to it
- shipping unverified “probably fixed” changes
- changing balance values unless bug severity justifies it

---

## 8. Recommended Verification by Area

### Combat
- start encounter
- play at least 3 turns
- confirm enemy turn resolves
- confirm win/lose state still transitions correctly

### Cards
- play affected card(s)
- verify energy cost, target rules, damage, buffs/debuffs
- verify draw/discard/exhaust behavior if touched

### Progression / Save
- create or load a run
- complete one encounter or state change
- save and reload
- confirm progression state persists

### UI
- verify visual state updates after gameplay event
- confirm no missing labels, icons, or obvious layout breakage

---

## 9. Release Patch Notes Format

Keep player-facing notes short:

- Fixed a combat flow issue that could leave turns in a bad state.
- Fixed incorrect card behavior affecting effect resolution.
- Fixed a progression bug related to save/load consistency.

Only mention what a player would notice.

---

## 10. Exit Criteria for a Patch

A patch is ready when:
- included bugs have a written repro
- each fix was re-tested on `release/v0.5.0`
- focused smoke checks passed
- no unrelated files are staged
- patch notes are short and accurate

If any of the above is missing, it is not ready.
