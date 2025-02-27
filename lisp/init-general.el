;;; init-general.el --- Summary -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:

(use-package general
  :demand t
  :config
  ;; (general-evil-setup)

  ;; (general-create-definer me/leader-keys
  ;;   :states '(normal insert visual emacs)
  ;;   :keymaps 'override
  ;;   :prefix "SPC"
  ;;   :global-prefix "M-SPC")

  ;; (me/leader-keys
  ;;  "SPC" '(execute-extended-command :wk "execute command"))
)

(provide 'init-general)
;;; init-general.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
