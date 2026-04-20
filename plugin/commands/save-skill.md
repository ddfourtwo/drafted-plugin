---
description: Capture reusable guidance from this conversation as an org skill so teammates and future agents inherit it automatically
argument-hint: <optional hint about what to save, e.g. "our interview protocol">
---

The user wants to preserve reusable guidance as a Drafted skill. Hint: $ARGUMENTS

Skills live at the org level — once saved, every agent working in the same organization can find it via `search_skills` / `load_skill` and follow its instructions without re-deriving them. This is the knowledge-leverage layer: learnings captured once, propagated everywhere, no human re-training each agent.

Typical things worth saving: research protocols, interview scripts, review checklists, coding conventions, writing voice, brand rules, decision frameworks, evaluation rubrics, "always do X before Y" process rules. If it's a pattern the user or their team will want the next agent to follow, it belongs in a skill.

Draft a clean skill, then call `add_skill`:

1. **Identify what to save.** Look at this conversation's established patterns — recurring rules, the user's stated preferences, process the team agreed on. Pick the most coherent, reusable chunk. If the user gave a hint in `$ARGUMENTS`, prioritize that.

2. **Draft the SKILL.md content** as clean markdown:
   - One-line purpose at the top
   - Numbered or bulleted rules (the actual guidance)
   - A short "when to apply" section if the trigger isn't obvious
   - Keep under ~40 lines — skills should be sharp, not exhaustive
   - Write in second person ("do X", "avoid Y") so any future agent can follow it directly

3. **Show the draft to the user** before saving. Include proposed `name` (Title Case), `description` (one line), and `tags` (3-5). Ask: "save this to the org library? Edit anything?"

4. **After approval**, call `add_skill` with name, description, content, tags, and `triggerPatterns` — patterns are phrases like "writing copy", "running a user interview", "reviewing a pull request", "planning a strategic decision" that future agents will match against to auto-surface this skill.

5. **Confirm** with the skill's slug and note: "Anyone in the org can now `load_skill: <slug>` or it'll auto-surface on matching tasks."

Don't save a skill without the user seeing the draft first.
