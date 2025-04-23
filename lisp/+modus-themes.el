;;; +modus-themes.el --- Summary -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun +modus-themes-load-operandi ()
  "Load the customized version of the modus-operandi."
  (interactive)
  (setq modus-themes-common-palette-overrides
        modus-themes-preset-overrides-cooler)
    
  (load-theme 'modus-operandi t nil))

(defun +modus-themes-load-vivendi ()
  "Load the customized version of the modus-vivendi."
  (interactive)
  
  (setq modus-themes-common-palette-overrides
        modus-themes-preset-overrides-faint)
  
  (load-theme 'modus-vivendi t nil))

(defun +modus-themes-toggle (appearance)
  "Load theme, taking current system APPEARANCE into consideration."
  (mapc #'disable-theme custom-enabled-themes)
  
  (pcase appearance
    ('light (+modus-themes-load-operandi))
    ('dark (+modus-themes-load-vivendi))))

(provide '+modus-themes)
;;; +modus-themes.el ends here
