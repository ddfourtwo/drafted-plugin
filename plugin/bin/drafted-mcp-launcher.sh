#!/bin/sh
# Drafted MCP launcher
#
# Why this script exists:
# Claude spawns MCP servers in parallel with the SessionStart hook that runs
# `npm install drafted@latest`. On a fresh machine the binary doesn't exist
# when Claude tries to spawn it, so the connector shows "failed" and users
# have to retry. This launcher closes the race by installing synchronously
# on first run, then exec'ing the real binary. Subsequent spawns skip the
# install and exec immediately. The SessionStart hook still runs in the
# background to keep drafted@latest fresh between sessions.
#
# Contract: stdout is reserved for MCP JSON-RPC. All diagnostics go to
# stderr so they don't corrupt the protocol stream.

set -e

DATA_DIR="${CLAUDE_PLUGIN_DATA:?CLAUDE_PLUGIN_DATA not set}"
BIN="$DATA_DIR/node_modules/.bin/drafted-mcp"

if [ ! -x "$BIN" ]; then
  echo "[drafted] First-run install of drafted MCP server..." >&2
  mkdir -p "$DATA_DIR"

  # Seed package.json so npm has a project to install into.
  if [ ! -f "$DATA_DIR/package.json" ]; then
    PLUGIN_PKG="${CLAUDE_PLUGIN_ROOT:-}/package.json"
    if [ -n "$CLAUDE_PLUGIN_ROOT" ] && [ -f "$PLUGIN_PKG" ]; then
      cp "$PLUGIN_PKG" "$DATA_DIR/package.json"
    else
      printf '{"name":"drafted-plugin-deps","private":true,"dependencies":{"drafted":"latest"}}\n' > "$DATA_DIR/package.json"
    fi
  fi

  # Install. Pipe to stderr so the MCP stdout stream stays clean.
  ( cd "$DATA_DIR" && npm install drafted@latest --silent --no-audit --no-fund --prefer-online ) >&2 || {
    echo "[drafted] npm install failed. Check your network and node/npm install." >&2
    exit 1
  }

  if [ ! -x "$BIN" ]; then
    echo "[drafted] Install completed but $BIN is still missing." >&2
    exit 1
  fi
fi

exec "$BIN" "$@"
