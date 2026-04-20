---
description: Bootstrap a new Drafted project with a brief and starter frames
argument-hint: <project name and optional one-line description>
---

The user wants to spin up a new design project. Their goal: $ARGUMENTS

1. Call `create_project` with a name derived from the user's input. Pick a clean name (Title Case, no awkward punctuation). Use the user's wording for the description if they gave one.
2. The response includes the new project ID and `frameUrl`. Call `open_project` on it to switch.
3. Write a short brief at `/contexts/research/brief.md` capturing:
   - What the user described
   - Implied goals / audience (your reasoning, kept brief)
   - Any constraints they mentioned

   Use markdown. Make it useful as a starting point — 6-12 lines, not a placeholder.
4. Anchor the brief with `anchor path: "/contexts/research/brief.md", anchored: true` so future writes/edits in this project surface it.
5. Call `focus` on the brief so the user sees it on their canvas.
6. Reply with: project URL, the brief frame URL, and a one-line "Next: tell me what to design."

Don't speculatively scaffold wireframes or designs yet — wait for the user to direct.
