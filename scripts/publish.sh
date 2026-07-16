#!/usr/bin/env bash
# publish.sh — MINT the DOI on Zenodo. IRREVERSIBLE. Author-only, on ilm01-lin.
#
# Token handling matches the established convention:
#   * Primary: ZENODO_TOKEN already exported in your environment.
#   * Fallback: sourced from your central token file if ZENODO_TOKEN is unset
#     — path taken from ZENODO_TOKEN_PATH, defaulting to your standing
#     ops/.zenodo_token. Nothing is placed inside this repo.
# The token is never passed inline (no --token), never written to disk here,
# never echoed.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p "$HOME/work/logs"; LOG="$HOME/work/logs/proclamation-publish.log"

if [ -z "${ZENODO_TOKEN:-}" ]; then
  TOKEN_PATH="${ZENODO_TOKEN_PATH:-ops/.zenodo_token}"   # your central ops token
  if [ -f "$TOKEN_PATH" ]; then
    ZENODO_TOKEN="$(cat "$TOKEN_PATH")"; export ZENODO_TOKEN
  else
    echo "ZENODO_TOKEN not in env and no token at '$TOKEN_PATH'." >&2
    echo "Use your normal method:  export ZENODO_TOKEN=\$(cat /path/to/ops/.zenodo_token)" >&2
    exit 3
  fi
fi
export ORCID="${ORCID:-0009-0002-0684-8320}"

echo "This will PUBLISH to Zenodo and MINT a permanent DOI. This cannot be undone."
read -r -p 'Type exactly  MINT PROCLAMATION v1.0  to proceed: ' CONFIRM
[ "$CONFIRM" = "MINT PROCLAMATION v1.0" ] || { echo "aborted."; exit 1; }

misty publish -m metadata/misty.json \
  -f proclamation/proclamation-v1.png proclamation/proclamation-v1.pdf \
     proclamation/proclamation-v1.txt proclamation/proclamation-v1.md \
  --output doi/result.json | tee -a "$LOG"

echo "[publish] DOI minted. Record it in metadata/misty.json, then re-run scripts/package.sh." | tee -a "$LOG"
