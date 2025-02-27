;;; init-format-all.el --- Summary -*- lexical-binding:t -*-

;;; Code:

;;; Commentary:

(use-package format-all
  :init
  ;;(setq format-all-formatters)
  :config
  (add-hook 'prog-mode-hook 'format-all-mode))

(provide 'init-format-all)
;;; init-format-all.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
