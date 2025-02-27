;;; init-fontaine.el --- Summary -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:

(use-package fontaine
  :init
  (setq fontaine-latest-state-file
	(locate-user-emacs-file "fontaine-latest-state.eld"))

  (setq fontaine-presets
	'((regular
	   :default-family "Aporetic Sans Mono"
	   :default-weight thin
	   :default-height 160

	   ;; :variable-pitch-family "CMU Serif"
	   :variable-pitch-family "SF Pro"
	   :variable-pitch-weight light
	   ;; :variable-pitch-height 1.1

	   :fixed-pitch-family "Aporetic Sans Mono"

	   :mode-line-active-family "Helvetica"
	   :mode-line-active-height 0.95

	   :mode-line-inactive-family "Helvetica"
	   :mode-line-inactive-height 0.95
	   )))

  (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular))
  :config
  (fontaine-mode 1))

(provide 'init-fontaine)
;;; init-fontaine.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
