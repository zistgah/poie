#!/usr/bin/env bash
# verify.sh — check artifact integrity and (if present) OpenTimestamps proofs.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p "$HOME/work/logs"; LOG="$HOME/work/logs/proclamation-verify.log"

echo "[verify] SHA-256 manifest…" | tee -a "$LOG"
( cd proclamation && sha256sum -c ../metadata/SHA256SUMS ) | tee -a "$LOG"

if command -v ots >/dev/null 2>&1; then
  shopt -s nullglob
  proofs=(ots/timestamps/*.ots)
  if (( ${#proofs[@]} )); then
    for p in "${proofs[@]}"; do
      echo "[verify] ots verify $p" | tee -a "$LOG"
      ots verify "$p" 2>&1 | tee -a "$LOG" || true
    done
  else
    echo "[verify] no .ots proofs yet (pending)." | tee -a "$LOG"
  fi
else
  echo "[verify] ots client not installed; skipping timestamp check." | tee -a "$LOG"
fi
echo "[verify] done." | tee -a "$LOG"
