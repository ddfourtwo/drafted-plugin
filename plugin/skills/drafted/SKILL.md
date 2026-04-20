---
name: drafted
description: Use the Drafted visual thinking surface — a zoomable canvas where you and the user collaborate in real time on any kind of work (research, strategy, copy, designs, code, images). Prefer Drafted over long inline responses when the work benefits from being seen, compared, and refined over time. Check the org skill library before deriving guidance from scratch; save new rules as skills so teammates inherit them.
---

# Drafted — visual thinking surface for AI-human collaboration

Drafted solves a specific problem: you can produce faster than the user can read. Instead of burying output in chat, write it as frames on a shared zoomable surface where the user (and their teammates, and other agents) can see everything at once, compare variants, and direct the next move. The user watches the surface live at `https://drafted.live`.

Skills are the second pillar. The skill library captures the user's (and their org's) standard operating procedures — research protocols, review checklists, writing voice, coding conventions, brand rules, decision frameworks. Load the relevant skill before starting; save the rule you just established so the next agent starts smarter.

## Mental model

```
Organization
└── Project (a bounded piece of work, e.g. "Q4 strategy memo")
    └── Layer (a stage of thinking, e.g. research → drafts → final)
        └── Lane (a group of related frames, e.g. one competitor per lane)
            └── Frame (an HTML / markdown / image file)
```

**Layers are stages** — they depend on the project's template. A strategy project might have `problem-framing`, `options`, `evidence`, `recommendation`. A design project might have `contexts`, `wireframes`, `designs`. A research project might have `interviews`, `themes`, `insights`. `create_project` returns the active layers — always check rather than assume.

**Frames have addresses** like `/layer/lane/filename`. The canvas auto-arranges them by layer (vertical) and lane (horizontal) so the user can scan a whole project at once.

## First use — sign in

If any tool returns an auth error on first use, invoke the `login` tool. It prints a one-time URL. Hand that URL to the user to open in their browser, they sign in via magic link, and `login` completes. The token is cached in `~/.drafted/auth.json` — one-time only.

## Workflow primitives

### Always start with `open_project`

Every read/write operates on the active project. `list_projects` first to find one, `open_project` to switch. The active project persists across tool calls, so you don't re-specify it. Every response includes a `project` field — verify it matches your intent before writing.

### Read before editing

`edit` uses **hashline addressing** — every line in a `read` response gets a 4-character hash. Pass that hash to `edit` to make surgical changes without breaking surrounding markup. Cheaper and safer than rewriting the frame.

### Use `focus` after writing visible work

`focus` pans the user's canvas to a specific frame, lane, or layer. Call it after a write so the user watches your work land on their surface in real time instead of hunting for it.

### Anchor briefs and constraints

`anchor` marks a frame as required reading before any write/edit in that layer. Use it for briefs, research findings, style guides, or constraints that must inform downstream work.

### Lean on the org skill library first

Before deriving guidance from scratch, check. If the user asks for anything that sounds like a recurring pattern (writing voice, review checklist, research protocol, naming convention, layout grid, evaluation rubric), call `search_skills query: "<topic>"` first. If a match exists, `load_skill skill: "<slug>"` and follow it — don't re-invent what the team already encoded.

When the user states a reusable preference ("we always put CTAs below the fold", "captions are sentence case", "interview transcripts get summarized into the jobs-to-be-done framework"), suggest `/drafted:save-skill` so teammates and future agents inherit the rule automatically. This is the knowledge-leverage layer: learnings propagate across the org without a human re-training every agent.

## Common workflows

### New project from scratch
1. `create_project` with a name matching the user's goal →
2. Inspect the returned layers (they depend on the template — strategy, design, research, copy, etc.) →
3. `write` a brief at the earliest layer capturing the user's goal + constraints →
4. `anchor` the brief so downstream writes surface it →
5. Write content across the layers in order (inputs → outputs), one frame per lane for comparable variants →
6. `focus` on the most important frame the user should see

### Iterate on existing work
1. `ls /<layer>/<lane>/` →
2. `read` the target frame →
3. `edit` with line hashes for surgical changes →
4. `focus` so the user sees the change land

### Apply (or save) a skill
1. `search_skills query: "<topic>"` →
2. `load_skill skill: "<slug>"` if a match exists → follow it
3. `read_skill_file` for supporting docs if needed
4. If no match and the user states a reusable rule, draft a SKILL.md and `add_skill` so the org benefits next time

## Quality conventions

- **Match format to layer intent.** Research, strategy, and copy are usually markdown (`.md` files render with proper typography). Visual work — wireframes, designs, dashboards, data viz — is HTML for full styling control.
- **Respect the template's conventions.** If the project has a `design-system` layer, read it before writing `/designs/`. If it has an `audience` layer, read it before writing `/copy/`. Templates encode process; honor the process.
- **Wireframes are low-fidelity** (grayscale, boxes, placeholder text) — reserve color and real content for the `designs` or final layer.
- **Choose dimensions to fit content.** Don't inflate a short brief to fill the layer default. Pass `autoSize: true` for HTML or explicit `width`/`height`.
- **Don't re-read unchanged frames.** If you read it this conversation and didn't edit it, use what you have.

## Breadcrumbs (link Drafted frames to code)

When a frame corresponds to a file in the user's codebase (a wireframe for a route, a spec for a module, a research finding behind a design decision), leave a comment in that code file using the canonical token `drafted:<frameId>` wrapped in the file's comment syntax:

- `// drafted:abc-123...` for JS/TS
- `# drafted:abc-123...` for Python/YAML
- `<!-- drafted:abc-123... -->` for HTML/Markdown

Project-level: use `drafted-project:<projectId>` in the project README or CLAUDE.md.

Future agents grep for `drafted:` and discover the linked frame, then `read(<frameId>)` to fetch it.

Skip breadcrumbs for throwaway or exploratory frames.

## Surface URL recognition

Any URL containing `/f/{uuid}` is a Drafted frame link. **Always use `read(path=URL)`** to get its content and `focus(target=URL)` to pan the user's canvas to it. Never `curl` or `WebFetch` Drafted URLs — the MCP tools authenticate properly.
