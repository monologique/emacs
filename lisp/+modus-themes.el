;;; +modus-themes.el --- Summary -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun +modus-themes-with-colors ()
  "Set the custom faces I want to customize."
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

(defun +modus-themes-load-operandi ()
  "Load the customized version of the modus-operandi."
  (interactive)
  (setq modus-themes-common-palette-overrides
        modus-themes-preset-overrides-cooler)
  (modus-themes-load-theme 'modus-operandi))

(defun +modus-themes-load-vivendi ()
  "Load the customized version of the modus-vivendi."
  (interactive)
  (setq modus-themes-common-palette-overrides
        modus-themes-preset-overrides-faint)
  (modus-themes-load-theme 'modus-vivendi))

(defun +modus-themes-toggle (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  
  (+modus-themes-with-colors)

  (pcase appearance
    ('light (+modus-themes-load-operandi))
    ('dark (+modus-themes-load-vivendi))))

(provide '+modus-themes)
;;; +modus-themes.el ends here
