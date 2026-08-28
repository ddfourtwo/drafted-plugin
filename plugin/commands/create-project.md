---
description: Start a new project — or a reusable template — with proper search of knowledge and skills first
argument-hint: <project name and what you want to do>
---

Spin up a project on the surface, or generalize one into a reusable template. Goal: $ARGUMENTS

First ask: **a new project, or a reusable template?** (This command does both.)

Search before creating (also satisfies the gates):
1. `fs(search, path="/o/<org>/wiki", query="<terms>")` for relevant knowledge. [G1]
2. `fs(search, path="/o/<org>/skills", query="<topic>")` for procedures that should be attached. [G2/G3]

Then:
- Create the project — a project is a folder: `fs(mkdir, path="/o/<org>/projects/<name>")`. It starts with **no layers**; you define them by writing into them.
- `fs(write, path="/o/<org>/projects/<name>/<layer>/<lane>/brief.md", content=...)` a real brief at the earliest layer (goal, audience, constraints — 6-12 lines, not a placeholder). The layer + lane auto-create.
- Attach the relevant skills you found via the skill gates.
- `fs(ls, path="/o/<org>/projects/<name>")` to confirm the structure, and hand the user the `projectUrl` from the response.

For a **template**: build the layer structure + anchored guidance, then note how to fork it next time. Don't speculatively fill downstream frames — wait for direction.
