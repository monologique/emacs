(use-package corfu
  :ensure t
  :config
  (global-corfu-mode))

(use-package emacs
  :ensure nil
  :init
  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (setq tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (setq text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (setq read-extended-command-predicate #'command-completion-default-include-p))


(use-package orderless
  :after corfu
  :init
  ;; Sets the completion styles to use
  (setq completion-styles '(orderless basic))

  ;; Disables the default category completion styles.
  (setq completion-category-defaults nil)

  ;; Customizes the completion behavior for specific categories
  (setq completion-category-overrides '((file (styles basic org-without-partial-completion)))))

(use-package cape
  :after corfu)

(provide 'init-corfu)
