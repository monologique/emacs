(use-package modus-themes
  :ensure nil
  :init
  (require-theme 'modus-themes)

  (setq modus-themes-italic-constructs t
	modus-themes-bold-constructs t)

  (setq modus-themes-common-palette-overrides
	modus-themes-preset-overrides-faint)
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
