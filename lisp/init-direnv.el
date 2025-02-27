;;; init-direnv.el --- Summary -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:

(use-package envrc
  :config
  (add-hook 'after-init-hook 'envrc-global-mode)
  (add-hook 'prog-mode-hook 'envrc-mode))

(provide 'init-direnv)
;;; init-direnv.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
