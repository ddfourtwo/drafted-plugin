---
description: Turn corrections you made in a project into enforced gates (anchors, attached skills, layer rules)
argument-hint: <optional: the correction to enforce>
---

When the user had to correct the work in this project, codify the correction so future work is compelled to comply. This is the nurture → enforce bridge. Correction: $ARGUMENTS

1. Identify the recurring correction(s) or standing rule from this session.
2. Choose the right Drafted-side gate per correction (each counts toward the project's context budget):
   - **Project anchor** — a brief, constraint, or style guide that must be in context project-wide: `frame(action="write")` it, then `frame(action="anchor")`. [G5]
   - **Attached skill** — a procedure that must be loaded before work: `/drafted:create-skill` (or `skill(action="search")` for an existing one), then `skill(action="attach")`. [G4]
   - **Layer rule** — a standing instruction for one stage: set that layer's rules via `project(action="update", layers=...)`. [G6]
3. Propose which mechanism for each correction, confirm with the user, then apply.
4. Confirm what is now enforced — the next session in this project will be gated on it automatically.

Keep within the project's context budget — if a deposit would exceed it, tighten existing gates instead of piling on.
