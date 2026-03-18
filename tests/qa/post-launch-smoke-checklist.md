# Post-Launch Smoke Checklist — Emotion Cards

Run this after any live bugfix intended for `release/v0.5.0`.

---

## 1. Baseline Boot Check
- [ ] Game launches without obvious errors
- [ ] Main flow/menu is reachable
- [ ] No immediate missing content or broken state is visible

## 2. Core Run Check
- [ ] Start a fresh run or valid test encounter
- [ ] Draw and play cards successfully
- [ ] End turn successfully
- [ ] Enemy turn resolves successfully
- [ ] Next player turn begins correctly

## 3. Combat Safety Check
- [ ] Damage resolves as expected
- [ ] Block/shield/defense state still behaves correctly
- [ ] Win state triggers correctly when enemy is defeated
- [ ] Lose/failure state still triggers correctly when player is defeated

## 4. Card Behavior Check
- [ ] Affected card or card group matches intended cost
- [ ] Affected card or card group matches intended effect
- [ ] Targeting rules still behave correctly
- [ ] Draw/discard/exhaust flow still behaves correctly if relevant

## 5. Progression / Save Check
- [ ] Run state can be saved if applicable
- [ ] Run state can be loaded if applicable
- [ ] No obvious progression rollback or corruption appears

## 6. UI / Content Check
- [ ] Updated values are reflected in UI
- [ ] No obvious missing icons, labels, or art references appear
- [ ] No duplicated, stale, or contradictory text appears

## 7. Regression Spot Check
- [ ] Reproduced the original bug before fix, or confirmed prior evidence
- [ ] Confirmed the exact repro path is now fixed
- [ ] Checked one adjacent scenario to catch collateral damage

## 8. Sign-Off
- **Bug ID:**
- **Tester:**
- **Branch:** `release/v0.5.0`
- **Result:** pass / fail / needs follow-up
- **Notes:**
