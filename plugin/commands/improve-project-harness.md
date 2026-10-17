---
description: Turn corrections you made in a project into enforced gates (anchors, attached skills, layer rules)
argument-hint: <optional: the correction to enforce>
---

When the user had to correct the work in this project, codify the correction so future work is compelled to comply. This is the nurture → enforce bridge. Correction: $ARGUMENTS

1. Identify the recurring correction(s) or standing rule from this session.
2. Choose the right Drafted-side gate per correction (each counts toward the project's context budget):
   - **Project anchor** — a brief, constraint, or style guide that must be in context project-wide: `fs(write, path="/o/<org>/projects/<project>/<layer>/<lane>/<file>", content=...)` it, then anchor it so it is listed as suggested reading (not enforced). [G5]
   - **Attached skill** — a procedure that must be loaded before work: `/drafted:create-skill` (or `fs(search, path="/o/<org>/skills", ...)` for an existing one), then ask the user to anchor it to the project (Skills view > Anchoring, effect Enforce; an agent cannot do this itself, and attaching a skill alone does not gate). Writes in that scope are then refused until the skill is read. [G4]
   - **Layer rule** — a standing instruction for one stage: set that layer's rules (an AGENTS.md in the layer) so they are surfaced when work happens there. [G6]
3. Propose which mechanism for each correction, confirm with the user, then apply.
4. Confirm what is now enforced — only an anchored skill gates writes; a project anchor and a layer rule do not.

Keep within the project's context budget — if a deposit would exceed it, tighten existing gates instead of piling on.
