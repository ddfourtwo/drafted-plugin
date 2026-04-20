---
description: Pan the Drafted canvas to a frame, lane, or layer
argument-hint: <frame path, frame URL, frame ID, or layer/lane>
---

The user wants their canvas to scroll/zoom to a specific target: $ARGUMENTS

1. Call the `focus` tool with `target: "$ARGUMENTS"`.
2. The tool accepts:
   - A full frame URL (`https://drafted.live/f/<uuid>`)
   - A frame ID (bare UUID)
   - A path (`/wireframes/homepage/hero.html`)
   - A lane (`/wireframes/homepage`)
   - A layer (`/wireframes`)
3. Confirm to the user with one short line: "Focused canvas on <human-readable target>". Don't repeat the URL.

If the target doesn't exist, suggest using `ls` to see what's available.
