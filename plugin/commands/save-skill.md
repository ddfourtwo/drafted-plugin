---
description: Save the current conversation's reusable guidance as an org skill so teammates and future agents can load it
argument-hint: <optional hint about what to save, e.g. "our brand voice">
---

The user wants to preserve reusable guidance as a Drafted skill. Hint: $ARGUMENTS

Skills live at the org level — once saved, any agent working in the same organization can find it via `search_skills` / `load_skill` and follow its instructions without re-deriving them. That's the whole point: capture the rule once, everyone inherits it.

Draft a clean skill, then call `add_skill`:

1. **Identify what to save.** Look at this conversation's established patterns — brand voice, review checklists, data-viz rules, naming conventions, "always do X before Y" rules. Pick the most coherent, reusable chunk. If the user gave a hint in `$ARGUMENTS`, prioritize that.

2. **Draft the SKILL.md content** as clean markdown:
   - One-line purpose at the top
   - Numbered or bulleted rules (the actual guidance)
   - A short "when to apply" section if the trigger isn't obvious
   - Keep under ~40 lines — skills should be sharp, not exhaustive
   - Write in second person ("do X", "avoid Y") so any future agent can follow it directly

3. **Show the draft to the user** before saving. Include proposed `name` (Title Case), `description` (one line), and `tags` (3-5). Ask: "save this to the org library? Edit anything?"

4. **After approval**, call `add_skill` with name, description, content, tags, and `triggerPatterns` — the patterns are phrases like "writing copy", "designing a landing page", "reviewing a pull request" that future agents will match against to auto-load this skill.

5. **Confirm** with the skill's slug and note: "Anyone in the org can now `load_skill: <slug>` or it'll auto-surface on matching tasks."

Don't save a skill without the user seeing the draft first.
