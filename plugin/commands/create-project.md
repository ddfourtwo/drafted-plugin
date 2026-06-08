---
description: Start a new project — or a reusable template — with proper search of knowledge, skills, and templates first
argument-hint: <project name and what you want to do>
---

Spin up a project on the surface, or generalize one into a reusable template. Goal: $ARGUMENTS

First ask: **a new project, or a reusable template?** (This command does both.)

Search before creating (also satisfies the gates):
1. `wiki(action="search")` for relevant knowledge. [G1]
2. `skill(action="search")` for procedures that should be attached.
3. `template(action="list")` for an existing template to fork. [G3 — also enforced on `project(action="create")`.]

Then:
- If a fitting template exists → `project(action="create", templateSlug=...)` to fork it; otherwise create fresh and define the layers.
- `project(action="open")` the new project.
- `frame(action="write")` a real brief at the earliest layer (goal, audience, constraints — 6-12 lines, not a placeholder).
- `frame(action="anchor")` the brief so downstream work surfaces it.
- Attach the relevant skills you found with `skill(action="attach")`.
- `focus` the brief so the user watches it land.

For a **template**: build the layer structure + anchored guidance, then note how to fork it next time. Don't speculatively fill downstream frames — wait for direction.
