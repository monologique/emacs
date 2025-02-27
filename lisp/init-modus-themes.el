(use-package modus-themes
  :ensure nil
  :init
  (require-theme 'modus-themes)

  (setq modus-themes-italic-constructs t
	modus-themes-bold-constructs t)

  (setq modus-themes-common-palette-overrides
	modus-themes-preset-overrides-faint)

  (setq my/font-sans-family "SF Pro")

  (modus-themes-with-colors
    (custom-set-faces
     `(org-level-1 ((,c :weight bold :height 1.5)))
     `(org-level-2 ((,c :weight bold :height 1.25)))
     `(org-level-3 ((,c :weight bold :height 1.175)))
     `(org-level-4 ((,c :weight bold :height 1.125)))
     `(org-level-5 ((,c :weight bold :height 1.1)))
     `(org-level-6 ((,c :weight bold :height 1.1)))
     `(org-level-7 ((,c :weight bold :height 1.1)))
     `(org-level-8 ((,c :weight bold :height 1.1)))
     `(org-block ((,c :inherit 'fixed-pitch :weight normal)))
     ))

  :config
  (defun my/apply-theme (appearance)
    "Load theme, taking current system APPEARANCE into consideration."
    (mapc #'disable-theme custom-enabled-themes)
    (pcase appearance
      ('light (load-theme 'modus-operandi t))
      ('dark (load-theme 'modus-vivendi t))))

  (my/apply-theme ns-system-appearance)
  
  (when (memq window-system '(mac ns))
    (add-hook 'ns-system-appearance-change-functions #'my/apply-theme)))

(provide 'init-modus-themes)
