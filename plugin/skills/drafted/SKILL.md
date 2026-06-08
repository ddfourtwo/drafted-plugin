---
name: drafted
description: Use the Drafted producibles harness — a compounding workspace that uplifts any AI across three primitives: knowledge (the org wiki), procedures (skills), and the project surface (frames on a shared real-time canvas). Prime from the harness before working, build durable artifacts as frames instead of burying output in chat, and deposit what you learned back so the next session starts smarter. When Google Drive is connected, prefer Google Workspace frames for docs, sheets, and slides.
---

# Drafted — a producibles harness that compounds

Drafted makes any AI more effective by giving it a memory and a workspace that get better with use. It has three primitives that layer:

- **Knowledge — the org wiki.** Durable facts, decisions, conventions. *More knowledge = less searching.*
- **Procedures — skills.** Reusable SOPs the org has encoded. *Better skills = more stable process.*
- **Surface — projects.** Reviewable work as frames on a shared zoomable canvas the user watches live at `https://drafted.live`. *Reusable projects + anchors = velocity with accuracy.*

The point is the **compounding loop**: you don't produce in a vacuum, you draw on what the org already knows and leave it richer each pass.

## The loop — prime → build → compound

- **Prime (session start).** Pull accumulated value in. The system *enforces* this: you must search the wiki before working, and a project's attached skills, anchored frames, and layer rules are auto-loaded when you open it. Don't fight the gates — they make you start smart.
- **Build (the work).** Produce artifacts as frames on the surface.
- **Compound (session end / when you notice something).** Deposit learning back: capture knowledge, distill or fix a skill, harden the project. This is *your* responsibility — the system can't force it, so do it.

## Mental model

```
Organization
└── Project (a bounded piece of work, e.g. "Q4 strategy memo")
    └── Layer (a stage of thinking, e.g. research → drafts → final)
        └── Lane (a group of related frames, e.g. one competitor per lane)
            └── Frame (an HTML / markdown / image file)
```

**Layers are stages** — they depend on the project's template. `project(action="create")` returns the active layers; always check rather than assume. **Frames have addresses** like `/layer/lane/filename`; the canvas auto-arranges them by layer (vertical) and lane (horizontal).

## The gates you'll encounter (and how to satisfy them)

These reset every session. A gate that blocks you tells you exactly what to call next — do it, don't work around it.

- **G1 — wiki search before work.** Before you read or edit anything, `wiki(action="search")` for relevant org knowledge.
- **G2 — prior-art before a new skill.** `skill(action="add")` requires a `skill(action="search")` first.
- **G3 — prior-art before a new project.** `project(action="create")` requires wiki + skill + `template(action="list")` searches first.
- **G4 — attached skills** are auto-injected when you open a project. Follow them — they're how the org does this work.
- **G5 — the project's anchored frames** are auto-injected on open. They are required reading (briefs, constraints, style guides).
- **G6 — a layer's rules** are surfaced when you work in that layer. Honor them.

## The commands (when to reach for each)

These bookend the loop. Prime/feed at the start, deposit at the end.

- `/drafted:onboard-drafted` — first run: orient + bootstrap the harness (seed wiki, starter skills, first project).
- `/drafted:ingest` — bring knowledge into the wiki (a research output, existing documents, or by interrogating the user).
- `/drafted:create-skill` — capture a repeatable procedure (with knowledge + prior-art search).
- `/drafted:create-project` — start a project or a reusable template (with knowledge/skill/template search).
- `/drafted:improve-wiki` — fix stale / wrong / fragmented knowledge.
- `/drafted:improve-skill` — fix a skill that underperformed.
- `/drafted:improve-project-harness` — turn corrections into enforced gates (anchors / attached skills / layer rules).
- `/drafted:extract` — session-end: deposit knowledge, a skill, and/or a template (the user picks which).

## Tool surface (action-based)

`project(list|open|create|update|move)` · `frame(read|write|edit|anchor|mv|search|…)` · `ls` · `skill(search|load|list|add|update|attach|…)` · `wiki(search|read|write|edit|mv|links|log|…)` · `template(list|create|fork|…)` · `focus` · `get_org` · `asset` · `layer`.

## Sign in

If a tool returns an auth error: on a desktop/CLI agent run the `auth(action="login")` tool (it prints a one-time URL; the user opens it). On the web/Cowork connector, authorization happens via the connector's OAuth — ask the user to re-authorize the Drafted connector in their settings, then retry.

## Working on the surface

- **Always `project(action="open")` first.** Every read/write operates on the active project. Use `project(action="list")` to find one. Every response includes a `project` field — verify it matches your intent before writing.
- **Default to the surface for substantive artifacts.** When asked to draft, write, plan, analyze, compare, design, document, summarize, report, spec, model, or make a deck/table, create or update frames instead of leaving the durable result only in chat. One visible frame per artifact or section.
- **Prefer Google Workspace when Drive is connected.** Call `get_org`; if it reports `googleDrive.connected: true`, use `frame(action="write", googleType="google-doc"|"google-sheet"|"google-slide", …)` for docs, sheets, and decks; populate immediately with the native write actions.
- **Read before editing.** `frame(action="edit")` uses hashline addressing — every line in a `frame(action="read")` response gets a 4-char hash; pass it to edit for surgical changes.
- **`focus` after writing** so the user watches your work land on their surface.

## Quality conventions

- **Match format to layer intent.** Research/strategy/copy are usually markdown; visual work (wireframes, designs, dashboards) is HTML.
- **Respect the template's conventions.** Read a `design-system` layer before `/designs/`; read an `audience` layer before `/copy/`.
- **Wireframes are low-fidelity** (grayscale, placeholders); reserve color and real content for the designs/final layer.
- **Choose dimensions to fit content** — `autoSize: true` for HTML, or explicit `width`/`height`.
- **Don't re-read unchanged frames** you already have this conversation.

## Surface URL recognition

Any URL containing `/f/{uuid}` is a Drafted frame link. Use `frame(action="read", path=URL)` to get its content and `focus(target=URL)` to pan the canvas to it. Never `WebFetch` Drafted URLs — the MCP tools authenticate properly.
