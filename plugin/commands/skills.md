---
description: Find, load, or browse Drafted skills — reusable agent instructions (UX guidelines, brand voice, review checklists) shared across your org
argument-hint: <search term, slug, or leave blank to list favorites>
---

Drafted skills are stored prompts and guidelines that any agent working in your org can load and follow. They're written once, reused everywhere. Current request: $ARGUMENTS

Pick the right branch:

1. **No argument** — call `list_project_skills` (favorites + project-attached) and summarize each as `<name> — <one-line description>`. Remind the user they can `/drafted:skills <topic>` to search or `/drafted:save-skill` to create one.

2. **Looks like a slug** (lowercase, hyphens) — call `load_skill skill: "$ARGUMENTS"`, show intro + section list, ask "apply this now, or load a specific file?"

3. **Free text search** — call `search_skills query: "$ARGUMENTS" scope: "all" limit: 10`. Output top matches as `<slug> — <description>`. Suggest `/drafted:skills <slug>` to load.

Skills work across the whole org. If the user's request points at a recurring pattern (brand voice, review checklist, data-viz rules) and no matching skill exists, mention they can save one with `/drafted:save-skill` so the rest of their team inherits it automatically.

Keep the response under 15 lines. Narrate — don't dump JSON.
