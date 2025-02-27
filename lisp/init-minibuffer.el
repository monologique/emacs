;;; init-minibuffer.el --- Summary -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:

(use-package vertico
  :init
  ;; Support opening new minibuffers from inside existing minibuffers.
  (setq enable-recursive-minibuffers t)
  
  ;; Hide commands in M-x which do not work in the current mode.  Vertico
  ;; commands are hidden in normal buffers. This setting is useful beyond
  ;; Vertico.
  (setq read-extended-command-predicate #'command-completion-default-include-p)
  
  ;; Emacs bug#76028: Add prompt indicator to `completing-read-multiple'.
  ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
  (defun crm-indicator (args)
    (cons (format "[CRM%s] %s"
                  (replace-regexp-in-string
                   "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                   crm-separator)
                  (car args))
          (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
  :config
  (vertico-mode))

;; Richer annotations in the minibuffer

(use-package marginalia
  :after vertico
  :config
  (marginalia-mode))

;; Persist history over Emacs restart

(use-package savehist
  :ensure nil
  :config
  (add-hook 'emacs-startup-hook #'savehist-mode))

(provide 'init-minibuffer)

;;; init-minibuffer.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
