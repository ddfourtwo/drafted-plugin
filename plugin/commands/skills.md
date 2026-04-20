---
description: Find, load, or browse Drafted skills — the org's standard operating procedures captured as reusable agent instructions
argument-hint: <search term, slug, or leave blank to list favorites>
---

Drafted skills are the org's captured SOPs — research protocols, review checklists, writing voice, coding conventions, decision frameworks, interview scripts, brand rules. Written once by a human or agent, then reused by every agent in the same org. Current request: $ARGUMENTS

Pick the right branch:

1. **No argument** — call `list_project_skills` (favorites + project-attached) and summarize each as `<name> — <one-line description>`. Remind the user they can `/drafted:skills <topic>` to search, or `/drafted:save-skill` to capture a new one.

2. **Looks like a slug** (lowercase, hyphens) — call `load_skill skill: "$ARGUMENTS"`, show intro + section list, ask "apply this now, or load a specific file?"

3. **Free text search** — call `search_skills query: "$ARGUMENTS" scope: "all" limit: 10`. Output top matches as `<slug> — <description>`. Suggest `/drafted:skills <slug>` to load.

Skills work across the whole org. If the user's request points at a recurring pattern (research protocol, review checklist, writing voice, coding convention) and no matching skill exists, mention they can save one with `/drafted:save-skill` so the rest of the team (and every future agent) inherits the rule automatically — that's the knowledge-leverage flywheel Drafted is designed around.

Keep the response under 15 lines. Narrate — don't dump JSON.
