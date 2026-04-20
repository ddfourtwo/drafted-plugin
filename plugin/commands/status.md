---
description: Show what Drafted project is active and what's recently changed
---

Use the Drafted MCP to give a quick status summary:

1. Call `list_projects` and identify the active project (look at `activeProject`).
2. If there's an active project, call `ls /` to show the layer structure.
3. Show the user:
   - Active project name + ID
   - Project URL (`https://drafted.live/project/<slug>`)
   - Per-layer frame counts (e.g. "research: 4 frames, drafts: 2 frames")
   - Any anchored frames (mention they MUST be read before writes in that layer)
   - The 5 most recently updated frames (use `summary: true` on ls if it helps)

If no project is active, list available projects and prompt the user to pick one with `open_project`.

Keep the response under 15 lines. No JSON dumps — narrate what you found.
