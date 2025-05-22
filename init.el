;;; init.el --- -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

;; * BENCHMARK AND TUNNING

(let ((emacs-start-time (current-time)))
  (add-hook 'emacs-startup-hook
            (lambda ()
              (let ((elapsed (float-time (time-subtract (current-time) emacs-start-time))))
                (message "[Emacs initialized in %.3fs]" elapsed)))))

(add-hook 'emacs-startup-hook (lambda () (select-frame-set-input-focus (selected-frame))))

;; * CORE

(require '+lib)
(require '+defaults)

(setq no-littering-etc-directory CACHE-DIRECTORY
      no-littering-var-directory CACHE-DIRECTORY)
(require 'no-littering)
(require 'setup)

(setup (:require +setup))

;; * THEMING

;; * Colorscheme
(setup (:require modus-themes +modus-themes)
  (when (boundp 'ns-system-appearance-change-functions)
    (add-hook 'ns-system-appearance-change-functions #'+modus-themes-load-auto)))

(setup (:require fontaine)
  (setq fontaine-latest-state-file
	(expand-file-name "fontaine-latest-state-file.eld" user-emacs-directory)
	fontaine-presets
        '((regular
           :default-family "Iosevka SS15"
           :default-height 160
           :default-weight light

           :mode-line-active-family "sans"
           :mode-line-active-height 0.9

           :mode-line-inactive-family "sans"
           :mode-line-inactive-height 0.9)))

  (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular))
  (add-hook 'enable-theme-functions #'fontaine-mode))

;; ** Frame 
(setup (:require spacious-padding)
  (:hook-into emacs-startup-hook))

(setup (:require olivetti)
  (:face olivetti-fringe ((t (:background nil :foreground nil))))
  (:hook-into org-mode
	      text-mode))


;; ** Modal editing and movement

(setup (:require meow +meow)
  (meow-global-mode 1))

;; ** Buffer and window management

(setup (:require activities))
(setup (:require popper))

;; ** Completion, infos and help

(setup (:require corfu)
  (setq tab-always-indent 'complete
	text-mode-ispell-word-completion nil
	read-extended-command-predicate #'command-completion-default-include-p)
  (global-corfu-mode 1))

(setup (:require cape)
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block))

(setup (:require vertico)
  (:option vertico-count 8)
  (:hook-into emacs-startup-hook))

(setup (:require marginalia)
  (:load-after vertico)
  (:hook-into vertico-mode-hook))

(setup (:require consult))

(setup (:require helpful)
  (:global (kbd "C-h f") #'helpful-callable
	   (kbd "C-h v") #'helpful-variable
	   (kbd "C-h k") #'helpful-key
	   (kbd "C-h x") #'helpful-command))

;; ** Version control
(setup (:require transient))
(setup (:require magit)
  (:load-after transient))

;; * NOTE-TAKING

(setup (:require denote)
  (:option denote-directory (DOCS-DIRECTORY "Notes" t)))

(setup (:require org org-modern)
  (:option sentence-end-double-space nil))

(setup (:require citar))


;; ** Languages

(setup (:require markdown-mode))

(setup (:require nix-ts-mode +nix)
  (:file-match "*.nix"))

;; ** QoL

(setup (:require ultra-scroll)
  (:option scroll-conservatively 101
           scroll-margin 0)
  (:hook-into emacs-startup-hook))

;;; init.el ends here
