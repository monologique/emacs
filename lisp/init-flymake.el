;;; init-flymake.el --- Summary -*- lexical-binding:t -*-

;;; Code:

;;; Commentary:

(use-package flymake
  :ensure nil
  :init
  (setq elisp-flymake-byte-compile-load-path load-path)
  :config
  (add-hook 'emacs-lisp-mode-hook #'flymake-mode))

(provide 'init-flymake)
;;; init-flymake.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
