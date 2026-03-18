# Launch-Day Incident Response Playbook: Emotion Cards
**Task:** QA-005  
**Project:** Emotion Cards — Roguelike Deckbuilder  
**Owner:** Sakura 🔍  
**Branch:** `release/v0.5.0`  
**Last Updated:** 2026-03-18

---

## 1. Purpose

This playbook defines how NorthernStar Studio should respond to launch-day incidents for **Emotion Cards**.

The goals are to:
- protect players from severe issues quickly
- keep triage calm and structured under pressure
- decide clearly between **monitoring**, **hotfix**, and **rollback**
- keep internal and external communication aligned

This document is intended for launch day and the first 48 hours after release, when issue volume, visibility, and player impact are highest.

---

## 2. Scope

This playbook applies to incidents affecting:
- game launch / startup
- save data integrity
- progression blockers
- crashes, freezes, and severe performance problems
- storefront / build mismatches
- broken live configuration or missing content
- platform-specific failures discovered after release

This playbook does **not** replace normal bug triage for minor issues or routine post-launch polish.

---

## 3. Launch-Day Operating Principles

1. **Protect player trust first.** Save loss, unplayable builds, and broken purchases outrank everything else.
2. **Stabilize before optimizing.** Stop the bleeding before debating ideal long-term fixes.
3. **One incident lead at a time.** Avoid fragmented decisions.
4. **Use evidence, not panic.** Confirm reproduction steps, scope, affected platform, and latest build/version.
5. **Communicate early, then update predictably.** Silence makes incidents feel worse.
6. **Do not ship blind.** Every hotfix or rollback decision must include quick QA validation.

---

## 4. Roles and Decision Ownership

| Role | Primary Responsibilities |
|------|--------------------------|
| **Incident Lead** | Owns severity call, decision log, update cadence, and next actions |
| **QA (Sakura)** | Reproduction, scope validation, severity recommendation, verification of fix/rollback |
| **Engineering (John)** | Root-cause investigation, workaround, hotfix implementation, build readiness |
| **Producer (Shig)** | Coordination, priority calls, blockers, team alignment |
| **Marketing/Comms (Gabe / Bin)** | External messaging, storefront/community updates, expectation setting |
| **Owner / Final Decision Maker (Bin)** | Approves major public-facing actions when needed, especially rollback or delayed messaging |

### Default escalation path
- **QA identifies / confirms incident** → notify **Shig + John** immediately
- **Severity 1 or Severity 2** → escalate to **Bin** and **Gabe** as soon as confirmed
- **Rollback decision** → requires **Engineering recommendation + Producer alignment + Bin approval**

---

## 5. Severity Levels

### Severity 1 — Critical / Launch Emergency
**Definition:** Game is effectively unplayable for a large share of players or risks permanent damage/trust loss.

**Examples:**
- Game will not launch on a primary platform
- Purchase/download leads to broken or wrong build
- Save corruption or save deletion
- Progression blocker affecting most players early in the game
- Crash/freeze affecting a majority of players or core gameplay path
- Critical service/configuration failure that prevents play

**Target response:**
- Acknowledge internally immediately
- Triage starts within **15 minutes**
- Decide between workaround / hotfix / rollback within **60 minutes** of confirmation if possible
- External holding statement as soon as issue is verified

**Default posture:**
- Treat as stop-the-line
- Prepare rollback in parallel while investigating hotfix

### Severity 2 — Major / High Impact
**Definition:** Major issue with substantial player impact, but the game remains playable for some or most users.

**Examples:**
- Frequent crash tied to one character, act, hardware class, or language setting
- Major performance regression on a supported platform
- Rewards, unlocks, or settings failing for a meaningful segment of users
- Soft-lock requiring force quit or restart
- Major UI/input issue blocking combat or deck management in common scenarios

**Target response:**
- Triage starts within **30 minutes**
- Initial scope and owner assigned within **60 minutes**
- Hotfix decision target within **2-4 hours** depending on repro confidence

**Default posture:**
- Investigate and communicate workaround if available
- Hotfix preferred over rollback unless impact expands rapidly

### Severity 3 — Moderate / Manageable
**Definition:** Noticeable issue with clear player friction, but limited scope or reasonable workaround exists.

**Examples:**
- Minor progression hiccup with recovery path
- Visual/UI defects causing confusion but not blocking play
- Rare crash with narrow reproduction path
- Incorrect text, settings persistence issue, or non-critical unlock bug

**Target response:**
- Triage within **same business block / launch window**
- Add to live issue tracker and monitor frequency
- Patch if low-risk; otherwise schedule for next update

### Severity 4 — Minor / Cosmetic
**Definition:** Low-impact issue with no meaningful gameplay or trust risk.

**Examples:**
- Typos
- Minor VFX/audio glitches
- Small layout issues
- Isolated art/content errors with no gameplay impact

**Target response:**
- Log, prioritize later, do not interrupt incident flow

---

## 6. Incident Intake Checklist

When a report comes in, capture the following before the thread gets noisy:
- reporter name / source (Steam forum, Discord, email, internal, creator)
- platform and OS
- build/version number
- region / language if relevant
- exact symptom
- first seen time
- frequency (always / intermittent / once)
- save state or progression point
- screenshot / video / log / crash dump availability
- reproduction steps
- whether a workaround exists

### Reliable evidence sources
- Direct player reports with screenshots/video
- QA reproduction on clean and current builds
- Crash logs / analytics / storefront status
- Multiple independent reports describing the same failure

Do **not** escalate severity based only on a vague single report unless save loss, payment risk, or platform-wide failure is plausible.

---

## 7. Triage Workflow

### Step 1: Confirm the incident
- Verify whether the issue is reproducible
- Check whether it affects current live build only
- Identify whether issue is tied to platform, language, hardware, or save state
- Determine whether issue started at launch or after a config/content change

### Step 2: Classify severity
Use player impact + scope + reversibility:
- **Can players play?**
- **Can they lose progress?**
- **Is there a workaround?**
- **How many players are likely affected?**
- **Is public trust already being damaged?**

### Step 3: Open an incident thread / log
Record:
- incident title
- severity
- owner
- status
- latest known scope
- next update time
- decision pending: monitor / hotfix / rollback

Suggested title format:
`[SEV-1] Steam live build crashes on startup after splash screen`

### Step 4: Assign parallel work
- **QA:** reproduce, narrow scope, build verification checklist
- **Engineering:** root cause and fix options
- **Producer:** dependencies, approvals, timeline
- **Comms:** draft holding statement and update templates

### Step 5: Decide response path
Choose one:
- **Monitor only** — issue low impact or unconfirmed
- **Workaround + monitor** — issue understood and recoverable
- **Hotfix** — live build should remain up while fix is prepared
- **Rollback** — current live build is causing unacceptable harm

---

## 8. Decision Framework: Monitor vs Hotfix vs Rollback

## Monitor only when
- impact is narrow or unconfirmed
- workaround is acceptable
- issue is not damaging saves, purchases, or core playability
- proposed fix carries more risk than the current defect

## Hotfix when
- issue is severe enough to justify interrupting planned work
- root cause is understood well enough for a targeted fix
- fix can be validated quickly
- keeping live build up is less harmful than reverting

## Rollback when
- current build is broadly unplayable
- save integrity or player trust is at risk
- hotfix timing is uncertain or too slow
- storefront/build mismatch is causing mass confusion
- fix confidence is low and every extra hour on the live build increases damage

### Rollback guardrails
Before rollback, confirm:
- exact version to revert to
- whether rollback risks save incompatibility
- whether storefront metadata, depots, or branch settings also need correction
- who owns the actual publishing action
- external message is ready before or immediately after rollback

---

## 9. Hotfix Coordination Notes

### Before greenlighting a hotfix
Engineering and QA should agree on:
- root cause or at least a highly confident trigger
- files/systems touched by the fix
- risk of regressions in combat, saves, progression, input, UI, or platform startup
- smoke test scope required before publish

### Minimum hotfix QA pass
For any launch-day hotfix, verify:
1. original issue reproduction no longer occurs
2. game launches and reaches main menu
3. start new run / load existing run
4. complete one combat or equivalent core gameplay loop
5. save and reload still function
6. affected platform-specific checks pass
7. version/build number is correct in live package

### Hotfix publish notes
- keep patch notes short and factual
- explicitly state whether restart or new download is required
- do not claim full resolution until QA confirms live build behavior
- continue monitoring for at least one update cycle after deployment

---

## 10. Rollback Coordination Notes

Rollback is the right call when the current release is doing more damage than a temporary step back.

### Rollback preparation checklist
- identify known-good prior build
- verify compatibility with current saves/settings
- confirm platform/store publishing steps and owner
- capture exact reason for rollback in incident log
- notify comms before execution
- prepare follow-up plan: fix-forward hotfix vs delayed relaunch update

### After rollback
- QA verifies previous build is actually live
- confirm the original failure is no longer affecting new sessions
- update community/store messaging with clear next steps
- keep collecting reports in case rollback did not fully resolve the issue

### Important note
A rollback is not failure. A slow, uncertain non-decision during a visible launch disaster is usually worse.

---

## 11. Communication Checklist

## Internal communication
- [ ] Post incident summary to core team channel/thread
- [ ] Include severity, scope, owner, and next update time
- [ ] Tag Shig, John, and Bin for SEV-1 / SEV-2 incidents
- [ ] Keep one source of truth for latest status
- [ ] Log every major decision and timestamp

### Internal update template
```text
Incident: [title]
Severity: [SEV-1 / SEV-2 / SEV-3 / SEV-4]
Status: Investigating / Workaround identified / Hotfix in progress / Rollback in progress / Resolved / Monitoring
Impact: [who is affected]
Scope: [platform/build/region]
Owner: [name]
Next update: [time]
Notes: [repro confidence, workaround, publish ETA, blockers]
```

## External communication
Use external messaging when:
- issue is player-visible and widely reported
- workaround needs to be shared
- rollback or hotfix is happening
- silence would clearly erode trust

### External communication rules
- acknowledge the issue plainly
- avoid speculation about root cause until confirmed
- give a workaround if one exists
- provide next update timing if full resolution is not immediate
- do not overpromise fix ETA
- thank players for reports and patience

### External holding statement template
```text
We’re aware of an issue affecting some Emotion Cards players on [platform].
We’re currently investigating and treating it as a priority.
If you’re experiencing [symptom], please [workaround if available].
We’ll share another update by [time/timeframe].
```

### External fix / rollback update template
```text
Update: We’ve [deployed a hotfix / rolled back the affected build] for the [platform] issue causing [symptom].
Please [restart the game / download the latest update / verify your build version].
We’re continuing to monitor and review new reports.
Thank you for the quick reports and patience.
```

### Channels to consider
- Steam announcement or community post
- Discord announcement/support channel
- Support email reply macro
- Social post only if issue visibility is broad enough to justify it

---

## 12. Launch-Day Monitoring Priorities

During launch day, QA should actively monitor for:
- startup failures
- save/load anomalies
- tutorial or first-run blockers
- combat soft-locks
- broken unlock/progression states
- controller/input failures
- major performance regressions
- storefront mismatch reports (wrong build, missing content, bad pricing/display)

### Priority order for first-pass checks
1. Can players launch the game?
2. Can they start or continue a run?
3. Can they complete early combat/tutorial flow?
4. Can they save, quit, and return safely?
5. Are storefront and build details correct?

---

## 13. Resolution and Post-Incident Review

An incident is only resolved when:
- live player impact is reduced to acceptable level
- workaround or fix has been validated
- comms have been updated
- open follow-up tasks are assigned

### Post-incident review questions
- What was the exact trigger?
- How quickly did we confirm scope?
- Was severity correct?
- Did we wait too long to hotfix or rollback?
- Did our messaging help or create confusion?
- What launch checklist item should be added or strengthened?

### Required outputs after a SEV-1 or SEV-2 incident
- brief timeline
- root cause summary
- player impact summary
- actions taken
- prevention follow-ups

---

## 14. Quick Reference Card

### If the report suggests save loss, broken purchases, or broad startup failure:
- classify as **SEV-1 until disproven**
- notify Shig + John + Bin immediately
- prepare rollback path in parallel

### If the issue is serious but narrow and reproducible:
- classify as **SEV-2**
- find workaround if possible
- evaluate targeted hotfix

### If the issue is annoying but survivable:
- classify as **SEV-3**
- document, monitor frequency, schedule patch

### If it is cosmetic only:
- classify as **SEV-4**
- log it and move on

---

*Prepared by Sakura 🔍 for NorthernStar Studio*