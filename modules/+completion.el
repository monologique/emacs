(setup (:elpaca corfu)
  (setq tab-always-indent 'complete
	text-mode-ispell-word-completion nil
	read-extended-command-predicate #'command-completion-default-include-p)

  (corfu-popupinfo-mode)
  (global-corfu-mode 1))

(elpaca-wait)

(setup (:elpaca cape)
  (add-hook 'completion-at-point-functions #'cape-dabbrev))

;;; Buffer and minibuffer

(setup (:elpaca vertico)
  (add-hook 'elpaca-after-init-hook #'vertico-mode))

(setup (:elpaca marginalia)
  (add-hook 'vertico-mode-hook #'marginalia-mode))

(setup (:elpaca orderless)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
	completion-category-overrides '((file (styles basic)))))
