---
description: Fix the wiki — reconcile stale, wrong, fragmented, or contradictory knowledge
argument-hint: <what's wrong, or the topic to clean up>
---

Improve the org wiki when knowledge has drifted. Issue/topic: $ARGUMENTS

1. `fs(search, path="/o/<org>/wiki", query="<terms>")` (3-5 paraphrased queries) and `fs(read, path="/o/<org>/wiki/<path>")` the affected pages — don't trust titles, open them.
2. Diagnose: duplicate pages, a stale fact, a contradiction, or knowledge fragmented across pages.
3. Propose the fix to the user: consolidate duplicates, correct the fact, reconcile the contradiction, or re-link fragments.
4. Apply with `fs(write, path="/o/<org>/wiki/<path>", content=<updated>)` (hashline `edit` for surgical changes) or `fs(mv, path="/o/<org>/wiki/<from>", to="/o/<org>/wiki/<to>")` (which rewrites inbound links). Check what links to a page before moving or archiving it.
5. Never hard-delete — `fs(rm, path="/o/<org>/wiki/<path>")` moves a page to the archive folder.

Leave the wiki more coherent than you found it — fewer, sharper, better-linked pages.
