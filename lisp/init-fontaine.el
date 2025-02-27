(use-package fontaine
  :init
  (setq fontaine-latest-state-file
	(locate-user-emacs-file "fontaine-latest-state.eld"))

  (setq fontaine-presets
	'((regular
	   :default-family "Iosevka Comfy"
	   :default-weight thin
	   :default-height 160

	   :variable-pitch-family "CMU Serif Extra"
	   :variable-pitch-weight normal
	   :variable-pitch-height 1.1

	   :mode-line-active-family "SF Pro"
	   :mode-line-active-height 0.9

	   :mode-line-inactive-family "SF Pro"
	   :mode-line-inactive-height 0.9
	   )))

  (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular))
  :config
  (fontaine-mode 1))

(provide 'init-fontaine)
