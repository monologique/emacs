(defconst IS-MAC (eq system-type 'darwin))
(defconst IS-LINUX (eq system-type 'gnu/linux))

(defvar cache-directory (locate-user-emacs-file ".etc")
  "Directory for all of Emacs' various files.")

(setq-default auto-save-interval 30
	      auto-save-list-file-prefix (expand-file-name "auto-saves/saves-" cache-directory)
	      auto-save-timeout 30
	      backup-by-copying t
	      bidi-display-reordering 'left-to-right
	      cursor-in-nonselected-windows nil
	      ffap-machine-p-known 'reject
	      frame-inhibit-implied-resize t
	      inhibit-startup-screen t
	      inhibit-startup-message t
	      inhibit-startup-echo-area-message t
	      initial-scratch-message nil
	      initial-buffer-choice nil
	      kept-new-versions 6
	      kept-old-versions 2
	      recenter-positions '(top middle bottom)
	      user-full-name "Paul-Mathias Logue"
	      user-mail-address "pml@monologique.me")

(unless IS-MAC (setq command-line-ns-option-alist nil))
(unless IS-LINUX (setq command-line-x-option-alist nil))

(provide '+core)
