---
description: Capture a repeatable procedure as an org skill — with proper knowledge and prior-art search
argument-hint: <what the procedure is for>
---

Turn a repeatable way of working into a Drafted skill so every future agent in the org follows it. Procedure: $ARGUMENTS

Do the searches first (they also satisfy the gates):
1. `wiki(action="search")` for relevant org knowledge the procedure should reference. [G1]
2. `skill(action="search")` for prior art — an existing skill to improve instead of duplicating. [G2 — also enforced on `skill(action="add")`.] If a close match exists, prefer `/drafted:improve-skill`.

Then define a PROPER procedure, not a vague note:
- a clear trigger ("when to use this"),
- ordered, concrete steps,
- success criteria / what "done right" looks like,
- written in the second person so any agent can follow it directly. Keep it sharp (~40 lines).

Show the draft to the user with a proposed `name` (Title Case), one-line `description`, `tags` (3-5), and `triggerPatterns`. After approval, `skill(action="add")`. Confirm with the slug and note it will auto-surface on matching tasks.
