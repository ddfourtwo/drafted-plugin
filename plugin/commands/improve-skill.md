---
description: Fix a skill you noticed is inefficient, wrong, or missing a step
argument-hint: <which skill, and what's off>
---

Improve an existing org skill when it underperformed in practice. Skill / issue: $ARGUMENTS

1. `skill(action="search")` then `skill(action="load")` the skill in question — read it fully.
2. Pinpoint the inefficiency: a missing step, a wrong instruction, an ambiguous trigger, or a step that wastes effort.
3. Propose the specific edit to the user — show before/after of the changed steps.
4. After approval, `skill(action="update")` (the version bumps automatically).
5. Confirm what changed so the next agent benefits.

Skills are the org's stable processes — every fix compounds across everyone who uses them.
