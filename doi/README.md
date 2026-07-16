# DOI Minting (Zenodo via Misty)

The DOI is minted on **Zenodo** from the canonical record
[`../metadata/misty.json`](../metadata/misty.json) using
[`misty-doi`](https://pypi.org/project/misty-doi/). Zenodo, DataCite,
`codemeta.json`, and `CITATION.cff` are all **derived** from that single record.

## Files here

- `misty.json` — copy of the canonical record used for this deposit.
- `zenodo.json` — the exact deposit body Misty sends to Zenodo (derived).
- `misty-doi.yaml` — Misty run configuration for this artifact.

## Token (established method — nothing new to place)

Misty reads the token **only from the environment** (`ZENODO_TOKEN`). Use your
existing token exactly as elsewhere — the token stays in its single central
location and is sourced into the environment; it is **not** copied into this repo:

```bash
export ZENODO_TOKEN="$(cat /path/to/your/ops/.zenodo_token)"   # your standing location
export ORCID=0009-0002-0684-8320
```

`scripts/publish.sh` will use `ZENODO_TOKEN` if it is already exported, and only
otherwise falls back to `ZENODO_TOKEN_PATH` (default `ops/.zenodo_token`). No
repo-local token file is created or required.

## Minting (author-only, irreversible)

```bash
# 1) dry run — packages locally, no network, prints file hashes
misty publish -m metadata/misty.json -f proclamation/proclamation-v1.* --dry-run

# 2) draft on Zenodo (not public) — review in the Zenodo UI
misty publish -m metadata/misty.json -f proclamation/proclamation-v1.* --no-publish

# 3) PUBLISH — mints the DOI (guarded, typed confirmation)
bash scripts/publish.sh
```

After minting, record the DOI in `metadata/misty.json` (`"doi"`), re-run
`scripts/package.sh` to regenerate the derived files, and commit. **Minting is
performed only by the author, never automatically.**

## GitHub–Zenodo alternative

Enable the repository in Zenodo's GitHub integration and publish a GitHub
Release (`v1.0`); Zenodo mints a DOI for the release archive automatically.

© 1993–2026 Abhishek Choudhary. All rights reserved.
