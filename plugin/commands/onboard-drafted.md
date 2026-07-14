---
description: First-run setup — orient to Drafted and bootstrap the harness (wiki, skills, first project)
argument-hint: <optional: what you want to start working on>
---

Onboard the user to Drafted — a producibles harness that compounds across three primitives: knowledge (the wiki), procedures (skills), and the project surface. Goal/context: $ARGUMENTS

This is the over-arching prime command: orient, then seed all three stores so every later session starts smart.

1. **Orient** — in 3-4 lines explain the loop: you *prime* from the harness (the system makes you search the wiki, and auto-loads the project's attached skills, anchors, and layer rules before you work), you *build*, then you *compound* (deposit what you learned). The more it's used, the less searching and the more stable the work.
2. **Name the org** — call `get_org` to list the user's orgs. Confirm which one the harness should be built in — if unsure, ask — then name it explicitly (`org=...`) on every create in the steps below, or bind it once for this session with `get_org(action="use", org="<name>")` and omit it thereafter. Never rely on an "active" org: a project-less create by a multi-org user is refused rather than guessed.
3. **Seed knowledge** — run the `/drafted:ingest` flow: help the user point at existing business materials (folders, docs, past research) or interrogate them for tacit knowledge, and land durable pages in the wiki.
4. **Seed procedures** — from those materials and the conversation, surface 1-3 candidate SOPs. For the most valuable, run the `/drafted:create-skill` flow.
5. **Seed the surface** — run the `/drafted:create-project` flow for the user's immediate piece of work (or a reusable template).
6. Close by showing what now exists (wiki pages, skills, project) and restate the one-line loop: prime → build → compound.

Keep it guided and conversational — one step at a time, confirming before each deposit. Don't dump everything at once.
