;; join-plines.lsp - Join selected polylines into one polyline
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
