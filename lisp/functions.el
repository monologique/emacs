;; from acdw
(defmacro +defvar (var value &rest _)
  "Quick way to `setq' a variable from a `defvar' form."
  (declare (doc-string 3) (indent 2))
  `(setq , var, value))

;; https://git.acdw.net/emacs/tree/lisp/acdw.el?id=3e78d1f8ca5b100f39577790614433398bc6a422#n120
(defun +clean-empty-lines (&optional begin end)
  "Remove duplicate empty lines from BEGIN to END.
Called interactively, this function acts on the region, if
active, or else the entire buffer."
  (interactive "*r")
  (unless (region-active-p)
    (setq begin (point-min)
          end (save-excursion
                (goto-char (point-max))
                (skip-chars-backward "\n[:space:]")
                (point))))
  (save-excursion
    (save-restriction
      (narrow-to-region begin end)
      (goto-char (point-min))
      (while (re-search-forward "\n\n\n+" nil :move)
        (replace-match "\n\n"))
      ;; Insert a newline at the end.
      (goto-char (point-max))
      (unless (or (buffer-narrowed-p)
                  (= (line-beginning-position) (line-end-position)))
        (insert "\n")))))
;; https://git.acdw.net/emacs/tree/lisp/acdw.el?id=3e78d1f8ca5b100f39577790614433398bc6a422#n60
(defun +ensure-after-init (function)
  "Ensure FUNCTION runs after init, or now if already initialized.
If Emacs is already started, run FUNCTION.  Otherwise, add it to
`after-init-hook'.  FUNCTION is called with no arguments."
  (if after-init-time
      (funcall function)
    (add-hook 'after-init-hook function)))

;; https://git.acdw.net/emacs/tree/lisp/acdw.el?id=3e78d1f8ca5b100f39577790614433398bc6a422#n68
(defmacro +with-ensure-after-init (&rest body)
  "Ensure BODY forms run after init.
Convenience macro wrapper around `+ensure-after-init'."
  (declare (indent 0) (debug (def-body)))
  `(+ensure-after-init (lambda () ,@body)))

;; https://git.acdw.net/emacs/tree/lisp/acdw.el?id=3e78d1f8ca5b100f39577790614433398bc6a422#n85
(defmacro +with-message (message &rest body)
  "Execute BODY, with MESSAGE.
If body executes without errors, MESSAGE...Done will be displayed."
  (declare (indent 1))
  (let ((msg (gensym)))
    `(let ((,msg ,message))
       (condition-case e
           (progn (message "%s..." ,msg)
                  ,@body)
         (:success (message "%s...done" ,msg))
         (t (signal (car e) (cdr e)))))))

(provide 'functions)
