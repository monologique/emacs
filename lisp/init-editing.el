;;; init-editing.el --- Summary -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:

(use-package electric
  :demand t
  :ensure nil
  :init
  (setq electric-pair-preserve-balance nil)
  :config
  (electric-pair-mode +1))

(provide 'init-editing)
;;; init-editing.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
