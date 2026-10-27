# GstarCAD Join Tools

Join selected lines, mixed lines and arcs, or existing polylines into a single polyline.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

After a break, a trim or an import you often end up with many small segments that should be one polyline. These commands run PEDIT's Multiple + Join path for lines, for mixed lines and arcs, and for existing polylines, without the option-by-option prompts.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/join-lines.lsp` | ;; join-lines.lsp - Join selected lines into one polyline
;; Command: JOINL
(defun c:JOINL ( / ss )
  (setq ss (ssget '((0 . "LINE"))))
  (if ss
    (progn
      (command "_.PEDIT" "_M" ss "" "_Y" "_J" "" "")
      (princ (strcat "\n" (itoa (sslength ss)) " lines joined."))
    )
    (princ "\nNothing selected.")
  )
  (princ)
)
 |
| `scripts/join-curves.lsp` | ;; join-curves.lsp - Join selected lines and arcs into one polyline
;; Command: JOINC
(defun c:JOINC ( / ss )
  (setq ss (ssget '((0 . "LINE,ARC"))))
  (if ss
    (progn
      (command "_.PEDIT" "_M" ss "" "_Y" "_J" "" "")
      (princ (strcat "\n" (itoa (sslength ss)) " curves joined."))
    )
    (princ "\nNothing selected.")
  )
  (princ)
)
 |
| `scripts/join-plines.lsp` | ;; join-plines.lsp - Join selected polylines into one polyline
;; Command: JOINPL
(defun c:JOINPL ( / ss )
  (setq ss (ssget '((0 . "LWPOLYLINE,POLYLINE"))))
  (if ss
    (progn
      (command "_.PEDIT" "_M" ss "" "_J" "" "")
      (princ (strcat "\n" (itoa (sslength ss)) " polylines joined."))
    )
    (princ "\nNothing selected.")
  )
  (princ)
)
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.
