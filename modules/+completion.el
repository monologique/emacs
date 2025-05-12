(setup (:package corfu)
  (setq tab-always-indent 'complete
	text-mode-ispell-word-completion nil
	read-extended-command-predicate #'command-completion-default-include-p)

  (corfu-popupinfo-mode)
  (global-corfu-mode 1))

; (elpaca-wait)

(setup (:package cape)
  (add-hook 'completion-at-point-functions #'cape-dabbrev))

;;; Buffer and minibuffer

(setup (:package vertico)
  (:hook-into after-init)
  (:option vertico-count 8
	   vertico-reverse-mode nil))

(setup (:package marginalia)
  (:hook-into vertico-mode))

(setup (:package orderless)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
	completion-category-overrides '((file (styles basic)))))
