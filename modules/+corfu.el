(elpaca corfu
  (setq tab-always-indent 'complete
	text-mode-ispell-word-completion nil
	read-extended-command-predicate #'command-completion-default-include-p)
  (global-corfu-mode 1))

(elpaca-wait)

(elpaca cape
  (add-hook 'completion-at-point-functions #'cape-dabbrev))

;;; Buffer and minibuffer

(elpaca vertico
  (add-hook 'elpaca-after-init-hook #'vertico-mode))

(elpaca marginalia
  (add-hook 'vertico-mode-hook #'marginalia-mode))

(elpaca orderless
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
	completion-category-overrides '((file (styles basic)))))
