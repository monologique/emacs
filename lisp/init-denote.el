;;; init-denote.el --- Summary -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:

(use-package denote
  :demand t
  :init
  (setq denote-directory (expand-file-name "~/Documents/Notes"))
  (setq denote-known-keywords '("emacs"
				"mathematics"
				"networking"
				"physics"))
  :config
  (add-hook 'dired-mode-hook #'denote-dired-mode))

(use-package spacious-padding
  :config
  (spacious-padding-mode 1))

(provide 'init-denote)
;;; init-denote.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
