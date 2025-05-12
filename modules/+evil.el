(setup (:elpaca evil)
    (setq evil-want-integration t
	  evil-want-keybinding nil)
    (evil-mode 1))

(setup (:elpaca evil-collection)
  (with-eval-after-load 'evil
    (evil-collection-init)))
