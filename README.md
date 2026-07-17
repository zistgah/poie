# Proclamation of Individual Equity

> **Kaivalyik Immutabilis** — *Na chour haryam, na cha raaj haryam* /
> *Nec furibus surripitur, nec sceptro usurpatur* —
> "Can neither be stolen by thieves, nor be usurped by sceptres."

This repository is the archival home of the **Proclamation of Individual
Equity**, a constitutional philosophical artifact. It is maintained not as
software but as a **preserved instrument of record**: a canonical text, fixed
at Version 1.0, accompanied by the metadata, integrity manifests, and
notarisation scaffolding required for durable, independently verifiable
scholarly citation.

---

## Overview

The Proclamation affirms the primacy of individual cognitive, cultural, and
linguistic equity, locating the mandate of equity at the level of the
individual identity and its **idiolect** — the irreducible linguistic
fingerprint of the self. The authoritative form of the Proclamation is the
parchment ([`proclamation/proclamation-v1.png`](proclamation/proclamation-v1.png)).
All other renderings in this repository are faithful transcriptions of that
source and introduce no new content.

The canonical text is reproduced verbatim in
[`proclamation/proclamation-v1.md`](proclamation/proclamation-v1.md).

## Motivation

Instruments of this kind lose their evidentiary value when their wording drifts,
their provenance is unclear, or their preservation depends on a single custodian.
This repository fixes the Proclamation in a citable, timestamped, and
independently verifiable form so that its state at Version 1.0 can be
established beyond dispute and referenced in the scholarly record.

## Scope

This repository preserves and publishes the artifact and its provenance. It
does **not** interpret, extend, modernise, or paraphrase the Proclamation. The
surrounding infrastructure exists solely to serve preservation, citation, DOI
minting, OpenTimestamps notarisation, and long-term versioned maintenance.

## Canonical Proclamation

The verbatim text is held in three synchronised renderings, all derived from the
parchment without alteration:

| Rendering | Path | Role |
|-----------|------|------|
| Parchment | `proclamation/proclamation-v1.png` | **Authoritative source** |
| Plain text | `proclamation/proclamation-v1.txt` | Machine-readable transcription |
| Markdown | `proclamation/proclamation-v1.md` | Formatted transcription |
| PDF | `proclamation/proclamation-v1.pdf` | Parchment + searchable text layer |

Integrity hashes for all four are recorded in [`metadata/SHA256SUMS`](metadata/SHA256SUMS).

## Repository Structure

```
proclamation/   Canonical artifact (png, txt, md, pdf) — Version 1.0
assets/         Parchment and presentation assets
metadata/       Canonical record (misty.json) + derived + provenance + hashes
doi/            Zenodo / Misty DOI packaging
ots/            OpenTimestamps proofs and instructions
docs/           GitHub Pages site (landing page + reference notes)
scripts/        package / verify / publish helpers
.github/        CI (metadata validation, Pages deploy)
```

The **single source of truth** for all descriptive metadata is
[`metadata/misty.json`](metadata/misty.json). The Zenodo deposit body,
DataCite record, `codemeta.json`, and `CITATION.cff` are **derived** from it
by [`misty-doi`](https://pypi.org/project/misty-doi/) and are regenerated,
never hand-edited.

## Preservation Strategy

Three independent guarantees:

1. **Integrity** — SHA-256 over every canonical artifact (`metadata/SHA256SUMS`).
2. **Notarisation** — OpenTimestamps proofs anchor those hashes to the Bitcoin
   blockchain, establishing existence-at-a-point-in-time without a central
   authority. See [`ots/README.md`](ots/README.md).
3. **Citation** — a Zenodo DOI provides a persistent, resolvable, academically
   citable identifier. See [`doi/README.md`](doi/README.md).

## Citation

Once the DOI is minted, cite via [`CITATION.cff`](CITATION.cff). Until then,
cite the repository and Version 1.0. The concept DOI (version-independent) will
resolve to the latest version; each version also receives its own DOI.

## DOI

**Status: pending.** The DOI is minted on Zenodo publication and recorded in
`metadata/misty.json` (`"doi"`), `CITATION.cff`, and `metadata/provenance.json`.
Minting is performed **only by the author**, never automatically.

## OpenTimestamps

Proofs live in `ots/timestamps/`. Anyone can independently verify them with the
`ots` client — no trust in this repository or its maintainer is required. See
[`ots/README.md`](ots/README.md).

## Versioning Policy

- This is **Version 1.0**, the canonical artifact.
- The original parchment is **never overwritten**.
- Every substantive change constitutes a **new version** with its own artifact,
  metadata, checksums, timestamps, and DOI. History is preserved additively.
- See [`GOVERNANCE.md`](GOVERNANCE.md) and [`CHANGELOG.md`](CHANGELOG.md).

## Endorse / Signatory campaign

Individuals and institutions can endorse this Proclamation with a decentralised,
OpenTimestamps-attested signature. See [`CAMPAIGN.md`](CAMPAIGN.md).

- Sign: https://project-ilm.github.io/tok-doi/sign-pie.html
- Public registry: https://github.com/project-ilm/tok-doi/blob/main/registry/pie/signatures.jsonl
- Signing infrastructure (Tok DOI): https://doi.org/10.5281/zenodo.21402745

---

**Author:** Abhishek Choudhary — AyeAI · ORCID [0009-0002-0684-8320](https://orcid.org/0009-0002-0684-8320) · GitHub [@obonac](https://github.com/obonac)
**License:** CC BY-ND 4.0 (content; per-category — see LICENSE) (see [`LICENSE`](LICENSE)).
**Copyright:** © 1993–2026 Abhishek Choudhary. All rights reserved.
