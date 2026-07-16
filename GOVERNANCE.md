# Governance

## Nature of the artifact

The Proclamation of Individual Equity is a **constitutional philosophical
artifact**, governed under the doctrine of **Kaivalyik Immutabilis**. It is
treated as an instrument of record, not as software or a living document.

## Immutability

1. The canonical parchment (`proclamation/proclamation-v1.png`) is the
   authoritative source and is **never overwritten**.
2. The **wording is never edited, modernised, simplified, or paraphrased.**
3. All in-repository renderings must reproduce the canonical text **verbatim**.

## Versioning

- Any substantive change produces a **new version** (e.g. `proclamation-v2`)
  as a distinct artifact, retaining all prior versions unchanged.
- Each version carries its own artifact set, `SHA256SUMS`, OpenTimestamps
  proofs, and DOI. The concept DOI resolves to the latest; version DOIs are
  permanent.
- Non-substantive repository changes (tooling, docs, packaging) do not create a
  new artifact version and are recorded in [CHANGELOG.md](CHANGELOG.md).

## Authority

- Authorship and custody rest solely with **Abhishek Choudhary (AyeAI)**.
- **DOI minting and Git history are author-only, irreversible actions** and are
  never performed automatically or by any collaborator or tool.

## Relationship to the Zistgah ecosystem

This artifact may be **registered within** the Zistgah envelope for provenance
and discovery (see `metadata/zistgah-seed.json`). Registration is
by-reference only: Zistgah is a habitat envelope, and this repository is a
sovereign, standalone artifact — it is **seeded within, not absorbed into**, the
ecosystem.

© 1993–2026 Abhishek Choudhary. All rights reserved.
