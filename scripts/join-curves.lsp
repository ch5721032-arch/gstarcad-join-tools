;; join-curves.lsp - Join selected lines and arcs into one polyline
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
