(use-package fontaine
  :init
  (setq fontaine-latest-state-file
	(locate-user-emacs-file "fontaine-latest-state.eld"))

  (setq fontaine-presets
	'((regular
	   :default-family "Iosevka Comfy"
	   :default-weight thin
	   :default-height 160

	   :variable-pitch-family "SF Pro"
	   ;; :variable-pitch-weight normal

	   :fixed-pitch-family "Iosevka Comfy"

	   :mode-line-active-family "SF Pro"
	   :mode-line-active-height 0.95

	   :mode-line-inactive-family "SF Pro"
	   :mode-line-inactive-height 0.95
	   )))

  (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular))
  :config
  (fontaine-mode 1))

(provide 'init-fontaine)
