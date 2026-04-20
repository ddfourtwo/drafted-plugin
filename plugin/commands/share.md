---
description: Get a shareable canvas URL for the active Drafted project
---

The user wants a link they can share with collaborators.

1. Call `list_projects` to find the active project (`activeProject` field).
2. If no project is active, ask the user to `open_project` first.
3. The shareable URL is `https://drafted.live/project/<slug>` — get the slug from the project record.
4. Output the URL as a clickable link with one line of context: "Send this to anyone in your organization to view the canvas live: <url>".

If `$ARGUMENTS` contains a project ID or name, look it up instead of using the active project.
