(use-package evil
  :init
  ;; Respect visual line
  (setq evil-respect-visual-line-mode t)

  ;; Use Emacs' built-in search
  (setq evil-search-module 'isearch)

  ;; For evil collection
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)

  ;; Better spliting for me
  (setq evil-split-window-below t)
  (setq evil-vsplit-window-right t)

  (setq evil-undo-system 'undo-redo)

  :config
  (evil-mode +1)

  (evil-set-initial-state 'messages-buffer-mode 'normal)

  ;; Add relative line numbers in prog-mode
  (setq display-line-numbers 'relative)
  (add-hook 'prog-mode-hook '(lambda () (display-line-numbers-mode +1)))
  )


(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-commentary
  :after evil
  :config
  (evil-commentary-mode))

(provide 'init-evil)
