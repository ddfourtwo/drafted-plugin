---
description: Start a new project on the Drafted surface — any kind of work (research, strategy, copy, design, code)
argument-hint: <project name and optional one-line description of what you want to do>
---

The user wants to spin up a new project on their Drafted surface. Their goal: $ARGUMENTS

Drafted handles any kind of structured thinking, not just design. Figure out the project type from the user's intent first: research synthesis, strategic decision, copywriting, competitive analysis, content calendar, user research, brand identity, programming, web design, image generation, or something else.

1. Call `create_project` with a clean name (Title Case, no awkward punctuation) derived from the user's goal. Inspect the returned layers — they depend on the template.
2. Call `open_project` on the new project ID.
3. Write a short brief at the earliest input layer (usually `/contexts/research/brief.md`, `/research/brief.md`, `/problem-framing/brief.md`, or similar — use the actual layer key from the create_project response). Capture:
   - What the user described (in their words)
   - Implied goals / audience / success criteria (your reasoning, kept brief)
   - Any constraints they mentioned
   6-12 lines of useful markdown. Not a placeholder.
4. `anchor path: "<brief path>", anchored: true` so future writes/edits in this project surface the brief.
5. Check the skill library with `search_skills query: "<project type>"` — if a relevant org skill exists, mention it so the user knows they can `load_skill` for guidance.
6. `focus` on the brief so the user sees it land on their surface.
7. Reply with: project URL, brief frame URL, any matching skill slug, and one line: "Next: tell me what to do."

Don't speculatively scaffold downstream frames (wireframes, drafts, recommendations) — wait for the user to direct. The brief + active project is enough to start.
