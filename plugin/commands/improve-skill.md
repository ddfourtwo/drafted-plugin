---
description: Fix a skill you noticed is inefficient, wrong, or missing a step
argument-hint: <which skill, and what's off>
---

Improve an existing org skill when it underperformed in practice. Skill / issue: $ARGUMENTS

1. `fs(search, path="/o/<org>/skills", query="<slug>")` then `fs(read, path="/o/<org>/skills/<slug>")` the skill in question — read it fully.
2. Pinpoint the inefficiency: a missing step, a wrong instruction, an ambiguous trigger, or a step that wastes effort.
3. Propose the specific edit to the user — show before/after of the changed steps.
4. After approval, `fs(write, path="/o/<org>/skills/<slug>", content=<updated>)` — writing an existing skill updates it (the version bumps automatically). If it was archived, writing restores it.
5. Confirm what changed so the next agent benefits.

Skills are the org's stable processes — every fix compounds across everyone who uses them.
