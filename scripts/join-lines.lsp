;; join-lines.lsp - Join selected lines into one polyline
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
