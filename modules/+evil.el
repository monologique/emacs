(setup (:package evil)
    (setq evil-want-integration t
	  evil-want-keybinding nil)
    (add-hook 'elpaca-after-init-hook 'evil-mode)

    (with-eval-after-load 'which-key
      (add-hook 'evil-mode-hook 'which-key-mode)))

(setup (:package evil-collection)
  (with-eval-after-load 'evil
    (evil-collection-init)))
