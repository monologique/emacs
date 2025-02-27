(use-package org
  :ensure nil
  :init
  ;; Edit settings
  (setq org-auto-align-tags nil
	org-tags-column 0
	org-catch-invisible-edits 'show-and-error
	org-special-ctrl-a/e t
	org-insert-heading-respect-content t)

  ;; Stying
  (setq org-startup-indented t
	org-hide-emphasis-markers t
	org-pretty-entities t)


  ;; (setq org-ellipsis "…")
  ;; (set-face-attribute 'org-ellipsis nil :inherit 'default :box nil)

  :config
  (add-hook 'org-mode-hook (lambda () (variable-pitch-mode +1)))
  (add-hook 'org-mode-hook (lambda () (visual-line-mode +1))))

(use-package org-bullets
  :after org
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

 (provide 'init-org)
