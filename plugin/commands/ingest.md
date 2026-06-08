---
description: Bring knowledge into the wiki — from a research output, existing documents, or by interrogating you
argument-hint: <optional: what to ingest, or a source>
---

Feed durable knowledge into the org wiki. Source/intent: $ARGUMENTS

First decide WHAT to ingest. If it's obvious from the conversation (a research run just finished, or the user named a source), use that. Otherwise ask which of these three modes fits:

1. **A research producible** — the output of a research run (a provider-native `/deep-research` or similar). Structure it into wiki pages.
2. **Existing documents** — the user points at local / remote / connected folders. Scour them (spawn sub-agents if there are many) for relevant material, shortlist, confirm, then ingest the right ones. Folder scour needs file access (desktop / Cowork); on web, use connected sources.
3. **Interrogate the user** (grill-me) — when the knowledge is in their head. Interview relentlessly, walking ONE branch of the decision tree at a time and proposing your recommended answer at each step, until you reach shared understanding. Then structure what you captured.

Then deposit:
- `wiki(action="search")` first (3-5 paraphrased queries) so you don't fragment existing pages.
- Propose the page set to the user before writing.
- Write with `wiki(action="write")`, or `wiki(action="source-register")` + `wiki(action="bulk-write")` for a batch. Cross-link related pages.
- `wiki(action="log")` a one-line entry for the ingest.

The wiki is the org's durable knowledge — write for the next agent and teammate, not just this session.
