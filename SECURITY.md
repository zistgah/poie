# Security & Integrity Policy

This repository's security concern is **artifact integrity and provenance**,
not executable safety (it ships essentially no runtime code).

## Reporting

Report integrity concerns — checksum mismatches, provenance discrepancies,
suspected tampering with the canonical artifact or its timestamps — privately to
the maintainer (AyeAI / @obonac) rather than via public issue, where feasible.

## Verifying integrity yourself

1. Recompute hashes: `sha256sum -c metadata/SHA256SUMS` from `proclamation/`.
2. Verify timestamps with the `ots` client (see `ots/README.md`).
3. Cross-check the DOI record on Zenodo against `metadata/provenance.json`.

No trust in this repository is required: the OpenTimestamps proofs are
independently verifiable against the Bitcoin blockchain.

© 1993–2026 Abhishek Choudhary. All rights reserved.
