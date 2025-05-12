;;; mono-defaults.el --- monologique core init -*- lexical-binding:t -*-
;;; Commentary
;;; Code:

;; Native compilation
(when (if (fboundp 'native-comp-available-p)
	  (setq native-comp-jit-compilation nil)
	  (startup-redirect-eln-cache (mono-etc-directory "eln-cache" t))))

(setq-default custom-file (mono-etc-directory "custom.el"))

;; --- Buffers
(setq-default cursor-in-non-selected-windows 'hollow
	      recenter-positions '(top middle bottom))
;; --- Startup
(setq-default inhibit-startup-screen t
	      inhibit-startup-message t
	      inhibit-startup-echo-area-message t
	      initial-scratch-message nil
	      initial-buffer-choice nil)

;; --- Save and Backup
(setq-default auto-save-interval 30
	      auto-save-list-file-prefix (mono-etc-directory "auto-save/saves-" t)
	      auto-save-timeout 30
	      auto-save-visited-interval 5
	      backup-by-copying t
	      backup-directory-alist `((".*" . ,(mono-etc-directory "backup/" t)))
	      kept-new-versions 6
	      kept-old-versions 2)

;; --- Info
(setq-default eldoc-idle-delay 0.1
	      eldoc-echo-area-use-multiline-p nil)

;; --- Rings
(setq-default kill-ring-max 100
	      mark-ring-max 100
	      global-mark-ring-max 100
	      save-interprogram-paste-before-kill t)
;; --- Typing ---
(setq-default file-name-shadow-properties '(invisible t intangible t)
	      ring-bell-function #'ignore
	      echo-keystrokes 0.1
	      use-short-answers t)

;;; --- Packages ---

;; --- `package'
(when (require 'package nil :noerror)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
  (setq package-user-dir (mono-etc-directory "elpa" t))
  (if (not (package-installed-p 'setup))
    (package-install 'setup))
  (package-initialize))

;; `no-littering'
(setq no-littering-etc-directory mono-etc-directory
      no-littering-var-directory mono-etc-directory)
(setup (:package no-littering))

;; `savehist'
(when (require 'savehist nil :noerror)
  (setq-default savehist-file (mono-etc-directory "savehist.el")))

;; `auto-revert'
(when (require 'savehist nil :noerror)
  (auto-revert-mode 1))

(provide 'mono-defaults)
;;; mono-defaults.el ends here
