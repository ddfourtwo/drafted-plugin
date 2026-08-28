---
description: Deposit what this session produced into the harness — knowledge, a skill, and/or a template
argument-hint: <optional: what to capture>
---

Session-end deposit. Harvest what's durable from this conversation back into the harness so the next session starts smarter. Focus: $ARGUMENTS

Review the session, then **present the user options for which store(s) to deposit into** — don't auto-decide. Offer any that apply:

- **Knowledge → wiki** — durable facts, decisions, or findings worth keeping. Search first (`fs(search, path="/o/<org>/wiki", ...)`) to avoid fragmenting, then `fs(write, path="/o/<org>/wiki/<path>", ...)`.
- **Procedure → skill** — a repeatable way of working that emerged. Follow `/drafted:create-skill`.
- **Template → surface** — a reusable project structure that emerged. Build it as a project via `fs(mkdir, ...)` + frames.

Show the user the candidate deposits per store, let them pick which to keep, then write the chosen ones with their approval. Confirm what landed where.

One command, all three stores — because at session end the human shouldn't have to remember which store is which.
