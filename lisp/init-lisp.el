;;; init-lisp.el --- Lisp configuration -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun my/set-elisp-header ()
  "Add minimal header and footer to an elisp buffer in order to placate flycheck."
  (interactive)
  (let ((fname (if (buffer-file-name)
                   (file-name-nondirectory (buffer-file-name))
                 (error "This buffer is not visiting a file"))))
    (save-excursion
      (goto-char (point-min))
      (insert ";;; " fname " --- Insert description here -*- lexical-binding: t -*-\n"
              ";;; Commentary:\n"
              ";;; Code:\n\n")
      (goto-char (point-max))
      (insert ";;; " fname " ends here\n\n")
      (insert ";; Local Variables:\n")
      (insert ";; byte-compile-warnings: (not free-vars unresolved)\n")
      (insert ";; End:"))))

(provide 'init-lisp)
;;; init-lisp.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
