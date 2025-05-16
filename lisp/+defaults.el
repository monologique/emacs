;; * CONSTANTS

(defconst IS-DARWIN (eq system-type 'darwin))
(defconst IS-LINUX (eq system-type 'gnu/linux))

(+define-directory CACHE-DIRECTORY (locate-user-emacs-file ".etc")
  "Directory for all of Emacs' various files.")

;; * DEFAULTS

(setq-default auto-save-interval 30
	      auto-save-list-file-prefix (expand-file-name "auto-saves/saves-" CACHE-DIRECTORY)
	      auto-save-timeout 30
	      backup-by-copying t
	      bidi-display-reordering 'left-to-right
	      cursor-in-nonselected-windows nil
	      ffap-machine-p-known 'reject
	      inhibit-startup-screen t
	      inhibit-startup-message t
	      inhibit-startup-echo-area-message t
	      initial-scratch-message nil
	      initial-buffer-choice nil
	      kept-new-versions 6
	      kept-old-versions 2
	      recenter-positions '(top middle bottom)
	      ring-bell-function 'ignore
	      user-full-name "Paul-Mathias Logue"
	      user-mail-address "pml@monologique.me")

(tool-bar-mode -1)
(scroll-bar-mode -1)

;; * MACHINES

(unless IS-DARWIN (setq command-line-ns-option-alist nil))
(unless IS-LINUX (setq command-line-x-option-alist nil))

(if IS-DARWIN
    (setq ns-use-proxy-icon nil
	  mac-option-key-is-meta nil
	  mac-command-key-is-meta t
	  mac-command-modifier 'meta
	  mac-option-modifier nil))

;; * MODES

(when (require 'display-line-numbers nil :noerror)
  (setq display-line-numbers-type 'relative
	display-line-numbers-current-absolute nil)
  (add-hook 'prog-mode-hook 'display-line-numbers-mode))

(when (fboundp 'window-divider-mode)
  (setq-default window-divider-default-places 'right-only
		window-divider-default-right-width 24)
  (add-hook 'emacs-startup-hook 'window-divider-mode))

(provide '+defaults)
