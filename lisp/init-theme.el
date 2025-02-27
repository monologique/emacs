;;; init-theme.el --- Summary -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:

(use-package modus-themes
  :ensure nil
  :init
  (require-theme 'modus-themes)

  (setq modus-themes-italic-constructs t
	modus-themes-bold-constructs nil)
  :config
  (defun my/modus-theme-with-colors ()
    "Set the custom faces I want."
    (modus-themes-with-colors
      (custom-set-faces
       `(vertical-border ((,c :foreground ,bg-main)))
       `(window-divider ((,c :foreground ,bg-main, :background ,bg-main)))
       `(window-divider-first-pixel ((,c :foreground ,bg-main)))
       `(mode-line ((,c :box nil)))
       `(mode-line-inactive ((,c :box nil)))
       `(window-divider-last-pixel ((,c :foreground ,bg-main)))
       `(line-number ((,c :background ,bg-main)))
       `(line-number-current-line ((,c :background ,bg-main)))
       `(fringe ((,c :background ,bg-main)))
       `(org-level-1 ((,c :weight bold :height 1.5)))
       `(org-level-2 ((,c :weight bold :height 1.25)))
       `(org-level-3 ((,c :weight bold :height 1.175)))
       `(org-level-4 ((,c :weight bold :height 1.125)))
       `(org-level-5 ((,c :weight bold :height 1.1)))
       `(org-level-6 ((,c :weight bold :height 1.1)))
       `(org-level-7 ((,c :weight bold :height 1.1)))
       `(org-level-8 ((,c :weight bold :height 1.1)))
       `(org-block ((,c :inherit 'fixed-pitch :weight normal))))))


  (defun my/apply-light-theme ()
    "Apply the light theme."
    (interactive)
    (setq modus-themes-common-palette-overrides
          modus-themes-preset-overrides-cooler)
    (load-theme 'modus-operandi t))

  (defun my/apply-dark-theme ()
    "Apply the dark theme."
    (interactive)
    (setq modus-themes-common-palette-overrides
          modus-themes-preset-overrides-faint)
    (load-theme 'modus-vivendi t))

  (defun my/apply-theme (appearance)
    "Load theme, taking current system APPEARANCE into consideration."
    (mapc #'disable-theme custom-enabled-themes)

    (pcase appearance
      ('light (my/apply-light-theme))
      ('dark (my/apply-dark-theme)))

    (my/modus-theme-with-colors))

  (my/apply-theme ns-system-appearance)

  (when (memq window-system '(mac ns))
    (add-hook 'ns-system-appearance-change-functions #'my/apply-theme)))

(provide 'init-theme)
;;; init-theme.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
