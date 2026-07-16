#!/usr/bin/env bash
# package.sh — regenerate derived metadata + build the offline DOI package.
# Non-destructive, no network, safe to run repeatedly.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p "$HOME/work/logs"; LOG="$HOME/work/logs/proclamation-package.log"
command -v misty >/dev/null 2>&1 || { echo "misty not found: pip install misty-doi"; exit 3; }

echo "[package] validate canonical metadata…" | tee -a "$LOG"
misty validate -m metadata/misty.json

echo "[package] derive zenodo/datacite/codemeta/CFF…" | tee -a "$LOG"
misty transform -m metadata/misty.json -o metadata/derived
cp metadata/derived/CITATION.cff  CITATION.cff
cp metadata/derived/codemeta.json codemeta.json
cp metadata/derived/zenodo.json   doi/zenodo.json
cp metadata/derived/datacite.json metadata/datacite.json
cp metadata/derived/metadata.json metadata/metadata.json

echo "[package] refresh SHA256SUMS…" | tee -a "$LOG"
( cd proclamation && sha256sum proclamation-v1.txt proclamation-v1.md \
    proclamation-v1.png proclamation-v1.pdf > ../metadata/SHA256SUMS )
cp metadata/SHA256SUMS ots/timestamps/SHA256SUMS

echo "[package] build offline doi-package (dry-run, no network)…" | tee -a "$LOG"
misty publish -m metadata/misty.json \
  -f proclamation/proclamation-v1.png proclamation/proclamation-v1.pdf \
     proclamation/proclamation-v1.txt proclamation/proclamation-v1.md \
  --dry-run --package-dir doi/doi-package --output doi/dry-run.json
echo "[package] done — see doi/doi-package/ and doi/dry-run.json" | tee -a "$LOG"
