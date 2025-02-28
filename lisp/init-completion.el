;;; init-completion.el --- Summary -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:

(use-package corfu
  :ensure t
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
  (setq read-extended-command-predicate #'command-completion-default-include-p)
  :config
  (global-corfu-mode))

;; Provides Completion At Point Extensions which can be used in combination

(use-package cape
  :after corfu
  :config
  (add-hook 'completion-at-point-functions #'cape-dabbrev))

;; Emacs completion style that matches multiple regexps in any order

(use-package orderless
  :after corfu
  :init
  ;; Sets the completion styles to use
  (setq completion-styles '(orderless basic))

  ;; Disables the default category completion styles.
  (setq completion-category-defaults nil)

  ;; Customizes the completion behavior for specific categories
  (setq completion-category-overrides '((file (styles basic)))))

(provide 'init-completion)
;;; init-completion.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
