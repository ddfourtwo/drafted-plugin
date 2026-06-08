---
description: Fix the wiki — reconcile stale, wrong, fragmented, or contradictory knowledge
argument-hint: <what's wrong, or the topic to clean up>
---

Improve the org wiki when knowledge has drifted. Issue/topic: $ARGUMENTS

1. `wiki(action="search")` (3-5 paraphrased queries) and `wiki(action="read")` the affected pages — don't trust titles, open them.
2. Diagnose: duplicate pages, a stale fact, a contradiction, or knowledge fragmented across pages.
3. Propose the fix to the user: consolidate duplicates, correct the fact, reconcile the contradiction, or re-link fragments.
4. Apply with `wiki(action="edit")` (hashline) or `wiki(action="mv")` (which rewrites inbound links). Check `wiki(action="links")` before moving or deleting.
5. `wiki(action="log")` what changed.

Leave the wiki more coherent than you found it — fewer, sharper, better-linked pages.
