# OpenTimestamps Notarisation

OpenTimestamps anchors the SHA-256 of each canonical artifact to the Bitcoin
blockchain, proving the artifact existed in its exact state at a point in time —
**without trusting any central authority, including this repository.**

## What gets stamped

The canonical artifacts under `proclamation/`. Current Version 1.0 digests:

| Artifact | SHA-256 |
|----------|---------|
| proclamation-v1.txt | `cea3276adf36927bb4afa4735efbd1117d1a78e1bb40f9404d7544b0fa7c16d6` |
| proclamation-v1.png | `a2fce8eeb033fb143f01ed84a4beac5a69248e982693c5b8b58c0557c46f3fbb` |
| proclamation-v1.pdf | `a33126d91752ed8ad152eb793c14c3f1eae456e2d4067b983fd7dd8a0b45948c` |

Full manifest: [`timestamps/SHA256SUMS`](timestamps/SHA256SUMS).

## Creating proofs (author, once per version)

Requires the OpenTimestamps client (`pip install opentimestamps-client`) with
network access to the calendar servers.

```bash
# via misty (preferred — same tool that mints the DOI)
misty ots stamp proclamation/proclamation-v1.png
misty ots stamp proclamation/proclamation-v1.pdf
misty ots stamp proclamation/proclamation-v1.txt

# or directly
ots stamp proclamation/proclamation-v1.*

# move proofs into place
mv proclamation/*.ots ots/timestamps/
```

Proofs are initially *pending*; upgrade them once the Bitcoin attestation lands:

```bash
misty ots upgrade ots/timestamps/proclamation-v1.png.ots
```

## Verifying (anyone)

```bash
ots verify ots/timestamps/proclamation-v1.png.ots
# expects proclamation/proclamation-v1.png beside the referenced hash
```

> **Status: pending.** No `.ots` proofs are committed yet. This environment has
> no network path to the OTS calendar servers, so stamping is performed by the
> author on `ilm01-lin`. The digests above are final and ready to stamp.

© 1993–2026 Abhishek Choudhary. All rights reserved.
