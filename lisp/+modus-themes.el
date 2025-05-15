(defun +modus-themes--invisible-dividers (&rest _)
  "Make window dividers invisible."
  (let ((bg (face-background 'default)))
    (custom-set-faces
     `(fringe ((t :background ,bg :foreground ,bg)))
     `(window-divider ((t :background ,bg :foreground ,bg)))
     `(window-divider-first-pixel ((t :background ,bg :foreground ,bg)))
     `(window-divider-last-pixel ((t :background ,bg :foreground ,bg))))))

(defun +modus-themes-load-auto (&rest _)
  "Load `modus-vivendi' or `modus-operandi' depending of the system appearance."
  (interactive)
  (mapc #'disable-theme custom-enabled-themes)
  
  (when (and IS-DARWIN
	     (boundp 'ns-system-appearance)
	     (boundp 'ns-system-appearance-change-functions))
    (let ((appearance ns-system-appearance))
      (pcase appearance
	('light (+modus-themes-load 'modus-operandi))
	('dark (+modus-themes-load 'modus-vivendi))))))


(defun +modus-themes-load (theme)
  "Load `modus-themes' THEME with customization depending of system appeareance."
  (setq modus-themes-common-palette-overrides
	'((fg-line-number-inactive "gray50")
          (fg-line-number-active fg-main)
          (bg-line-number-inactive unspecified)
          (bg-line-number-active unspecified)))

  (add-hook 'modus-themes-post-load-hook #'+modus-themes--invisible-dividers)

  (modus-themes-load-theme theme))

(provide '+modus-themes)
