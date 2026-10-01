---
name: drafted
description: Use the Drafted producibles harness — a compounding workspace that uplifts any AI across three primitives: knowledge (the org wiki), procedures (skills), and the project surface (frames on a shared real-time canvas). Drafted is navigated like a filesystem — one fs tool, one path grammar, org first: `fs(ls, path="/")` lists your orgs, then `/o/<org>/<root>/...`. Prime from the harness before working, build durable artifacts as frames instead of burying output in chat, and deposit what you learned back so the next session starts smarter. When Google Drive is connected, prefer Google Workspace frames for docs, sheets, and slides. When the local `gws` CLI is signed in, read the user's Gmail, Drive and Calendar with it as source material and build the result in Drafted.
---

# Drafted — a producibles harness that compounds

Drafted makes any AI more effective by giving it a memory and a workspace that get better with use. It has three primitives that layer:

- **Knowledge — the org wiki.** Durable facts, decisions, conventions. *More knowledge = less searching.*
- **Procedures — skills.** Reusable SOPs the org has encoded. *Better skills = more stable process.*
- **Surface — projects.** Reviewable work as frames on a shared zoomable canvas the user watches live at `https://drafted.live`. *Reusable projects + anchors = velocity with accuracy.*

The point is the **compounding loop**: you don't produce in a vacuum, you draw on what the org already knows and leave it richer each pass.

## The surface is a filesystem — one tool, one path grammar

There is exactly **one** tool to know: `fs`. It looks, feels, and behaves like a local filesystem, and an **org is the top folder** — you address an org, you never switch to it:

```
fs(ls, path="/")                                   → the orgs you belong to
fs(ls, path="/o/<org>")                            → that org's wiki · skills · projects
/o/<org>/wiki/<path>                                org knowledge pages (markdown, free nesting)
/o/<org>/skills/<slug>                              reusable procedures (flat: one dir per skill)
/o/<org>/projects/<project>/<layer>/<lane>/<file>   frames on the surface (project → layer → lane → file)
```

Verbs: `ls` (list) · `read` (cat, hashline-annotated) · `write` (create/overwrite) · `edit` (hashline ops) · `mv` (rename/move) · `rm` (move to archive) · `mkdir` (create a project) · `search` (grep).

**A project is a folder.** It starts with **no layers** — writing to `/o/<org>/projects/<name>/<layer>/...` auto-creates the layer (mkdir -p). The agent defines the filesystem structure by writing into it. URLs are the same paths: `https://drafted.live/o/<org>/projects/<project>/<layer>/<lane>/<file>` — the URL's pathname IS the fs path (one canonical link for both humans and agents). Bare `/wiki`, `/skills`, `/projects` roots still work via the session's working org.

## The loop — prime → build → compound

- **Prime (session start).** Pull accumulated value in. The system *enforces* this: you must search the wiki before working (G1), and a project's attached skills and anchored frames are required reading when you open it. Don't fight the gates — they make you start smart.
- **Build (the work).** Produce artifacts as frames on the surface.
- **Compound (session end / when you notice something).** Deposit learning back: capture knowledge, distill or fix a skill, harden the project. This is *your* responsibility — the system can't force it, so do it.

## The gates you'll encounter (and how to satisfy them)

These reset every session. A gate that blocks you tells you exactly what to call next — do it, don't work around it.

- **G1 — wiki search before work.** Before reading or editing anything, `fs(search, path="/o/<org>/wiki", query="<terms>")` for relevant org knowledge.
- **G2 — prior-art before a new skill.** Writing a new `/o/<org>/skills/<slug>` requires `fs(search, path="/o/<org>/skills", query="<topic>")` first.
- **G3 — prior-art before a new project.** Creating a project requires wiki + skill searches first.
- **G4 — attached skills** are auto-injected when you open a project. Follow them — they're how the org does this work.
- **G5 — the project's anchored frames** are required reading (briefs, constraints, style guides).
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

## Working on the surface

- **Navigate by path, exactly like a filesystem.** `fs(ls, path="/")` to see your orgs; `fs(ls, path="/o/<org>/projects")` to see a project list; `fs(ls, path="/o/<org>/projects/<project>")` for layers/lanes; `fs(ls, path="/o/<org>/projects/<project>/<layer>")` for frames. The project is resolved from the path itself — no separate "open" step.
- **Create a project with `fs(mkdir, path="/o/<org>/projects/<name>")`** — or just `fs(write, path="/o/<org>/projects/<name>/<layer>/<lane>/<file>", content=...)` and the project + layer auto-create in the addressed org.
- **Default to the surface for substantive artifacts.** When asked to draft, write, plan, analyze, compare, design, document, summarize, report, spec, model, or make a deck/table, create or update frames instead of leaving the durable result only in chat. One visible frame per artifact or section.
- **Read before editing.** `fs(read)` returns every line hashline-annotated (`1abc|<content>`); `fs(edit, ops=[{type:"replace", lineHash:"1abc", newContent:"..."}])` targets exactly that line. For partial reads, pass `lines: "2-50"` — you get back just that range, still hash-annotated, and can edit within it.
- **Prefer Google Workspace when Drive is connected.** `whoami` reports it — `googleDrive.connected: true` means use `fs(write, path=".../<name>.google-doc"|".google-sheet"|".google-slide")` for docs, sheets, and decks, populated immediately with the matching native write action. False means they cannot be created at all: use `.md`/`.html` frames and don't ask the user which fallback they want.
- **`fs(mv, from="/o/<org>/projects/<p>/<layer>/<lane>/<file>", to="...")`** renames or moves (cross-project too). **`fs(rm, path="/o/<org>/projects/<project>")` archives** — agents never hard-delete; the archive is in the web UI.
- **Return a clickable link** for what you touched — the `frameUrl`/`projectUrl` in the fs response is the URL the user opens.

## Source material from Google (`gws`) — Drafted holds the work

Local sessions may have Google's Workspace CLI, `gws`, signed in **read-only** to the user's **own** Google account (set up by the installer or `drafted google-setup`). Split the jobs: **`gws` reads what already exists** (mail, Drive files, calendar) on the user's machine with the user's token. **Drafted is where what you make from it lives, and the only way anything is sent.** Don't use Drafted as a mail store, and don't leave the result in chat.

- **Check first.** `gws auth status` is ready when `has_refresh_token` is `true` and a scope contains `/auth/gmail`. Read those two fields; don't echo the whole output. If it isn't ready, suggest `! drafted google-setup` once (macOS/Linux; it's interactive, so the user runs it). Remote sessions (claude.ai, `/mcp`) have no `gws`, so skip this section there.
- **Ask before you read.** The first inbox or Drive read in a session needs the user's yes and a scope ("last 30 days", "threads with Acme", "this folder"). Offer the narrowest useful one.
- **Headers before bodies.** List with `gws gmail users threads list --params '{"userId":"me","q":"newer_than:30d -category:promotions -category:social","maxResults":50}'`. Get headers with `gws gmail users threads get --params '{"userId":"me","id":"<threadId>","format":"metadata","metadataHeaders":["From","Subject","Date"]}'` and triage on subject, participants and date. Open a body (`gws gmail +read --id <messageId>`) only for threads you will actually use. Drive: `gws drive files list --params '{"q":"trashed = false","orderBy":"modifiedTime desc","pageSize":50,"fields":"files(id,name,mimeType,modifiedTime,webViewLink)"}'`. When unsure of a method's shape, run `gws schema <service.resource.method>`.
- **Synthesize, never copy.** A frame or wiki page carries your synthesis plus a link back to the source (`https://mail.google.com/mail/u/0/#all/<threadId>`, or the Drive file's `webViewLink`). It never carries pasted email bodies or other people's addresses. The surface is shared with collaborators; the inbox is not. Quote only what the user asks for, attributed.
- **Every send goes through Drafted, and the user approves it.** `gws` is signed in read-only, and it stays that way. To send, draft the email, then `action(action="propose", type="send_email", payload='{"from":"<the user\'s own connected Gmail address>","to":"<one address>","subject":"<one line>","body":"<plain text>"}', reason="<one line: why>")`. The user reads it and approves it in the Drafted UI. Nothing is sent before that, and you cannot approve it yourself. It goes out AS the user, from their Gmail connected in Drafted Settings; if the proposal is refused because none is connected, tell them to connect it there. Never send by any other route (widening the `gws` sign-in, SMTP, another tool), even when asked to "just send it": propose, and point the user to the approval.

## Quality conventions

- **Match format to layer intent.** Research/strategy/copy are usually markdown; visual work (wireframes, designs, dashboards) is HTML.
- **Wireframes are low-fidelity** (grayscale, placeholders); reserve color and real content for the designs/final layer.
- **Choose dimensions to fit content** — `autoSize: true` for HTML, or explicit `width`/`height`.
- **Don't re-read unchanged frames** you already have this conversation.
- **Diagrams: prefer native Excalidraw.** For flowcharts, process maps, architecture/system/data-flow diagrams, or visual maps, write a `.excalidraw` file (scene JSON) and load the `excalidraw-drafted` skill for the authoring guidance. Use HTML/markdown frames for web/UI mockups, rich layouts, or non-editable artifacts.

## Skill authoring

- **Git is the source of truth for skills; Drafted renders, indexes, and searches.** When a repo is connected to a folder, the skills under `.agents/skills/` in that repo ARE the skills for that folder — authoring happens by committing to git, not by writing into Drafted. Drafted write paths for a repo-owned skill return `409 repo_owned` naming the repo, branch, and path to commit to. Use `repo(action="rescan")` after a push so the index reflects the change.
- **For a folder with NO connected repo, author skills in Drafted** with `fs(write, path="/o/<org>/skills/<slug>", content=..., readme=...)` (G2 gate first). A `README.md` (the `readme` param) is optional but recommended — it is what renders for the skill directory on GitHub if the skill is ever exported; omitting it creates the skill with a warning. A skill is a directory: `fs(write, path="/o/<org>/skills/<slug>/README.md", content=...)` and any other supporting file work once the skill exists, and `fs(ls, path="/o/<org>/skills/<slug>")` lists them. `fs(mv, path="/o/<org>/skills/<old>", to="/o/<org>/skills/<new>")` renames.
- **Knowledge goes in the wiki, procedure in skills.** Drafted owns org knowledge (wiki pages via `fs` under `/o/<org>/wiki/`); git owns reusable procedure (skills under `.agents/skills/`). Don't put a skill body in a wiki page or a knowledge doc in a SKILL.md.
- **Machine-specific build output is never portable.** Build `node_modules`, downloaded browsers, compiled binaries into a `.skillinstall/` directory inside the skill — Drafted always strips it on push and skill push auto-gitignores it, so the rebuildable bundle stays local while the method and recipe live in git/Drafted.
- **Improve skills when you find a better way.** Fix or distill a skill that underperformed rather than leaving it stale.

## Surface URL recognition

Any URL containing `/f/{uuid}` is a Drafted frame link — `fs(read, path=URL)` gets its content. Canonical links are the fs paths themselves: `/o/<org>/wiki/...`, `/o/<org>/skills/<slug>`, `/o/<org>/projects/<project>/<layer>/<lane>/<file>`. Never `WebFetch` Drafted URLs — the MCP tools authenticate properly.
