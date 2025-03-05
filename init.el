;;; init.el --- Summary -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(setup (:require +emacs))

(setup (:elpaca exec-path-from-shell)
  (require 'exec-path-from-shell)
  (dolist (var '("SSH_AUTH_SOCK"
                 "SSH_AGENT_PID"
                 "GPG_AGENT_INFO"
                 "LANG"
                 "LC_TYPE"
                 "NIX_SSL_CERT_FILE"
                 "NIX_PATH"))
    (add-to-list 'exec-path-from-shell-variables var))
  (exec-path-from-shell-initialize))

;;; Frame and faces settings

(setup (:require +frame)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  ;; MacOS niceties
  (when (eq system-type 'darwin)
    (push '(undecorated-round . t) default-frame-alist)
    (setq ns-use-native-fullscreen t
	  mac-option-key-is-meta nil
	  mac-command-key-is-meta t
	  mac-command-modifier 'meta
	  mac-option-modifier nil))
  ;; This is how I want my default frame to be like at startup
  (add-hook 'emacs-startup-hook #'+frame-center-2/3)
  (add-hook 'window-setup-hook #'raise-frame))

(setup (:elpaca fontaine)
  (:require fontaine)
  (:option fontaine-latest-state-file
	   (locate-user-emacs-file "fontaine-latest-state.eld"))
  (:option fontaine-presets
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
	      :mode-line-inactive-height 0.95)))

  (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular))
  (:hook-into emacs-startup))

(setup (:elpaca modus-themes)
  (:require modus-themes +modus-themes)
  (:option modus-themes-itatlic-constructs t
	   modus-themes-bold-constructs nil)
  (when (memq window-system '(mac ns))
    (add-hook 'ns-system-appearance-change-functions #'+modus-themes-toggle)))

(setup (:elpaca spacious-padding)
  (:load-after modus-themes)
  (:require spacious-padding)
  (add-hook 'modus-themes-post-load-hook #'spacious-padding-mode))

(setup (:elpaca ultra-scroll :host github :repo "jdtsmith/ultra-scroll" :branch "main")
  ;; From the wiki
  (:option scroll-conservatively 101
	   scroll-margin 0)
  (:hook-into window-setup))

;;; Keybindings

(setup (:elpaca meow)
  (require '+meow)
  (:option meow-cheatsheet-layout meow-cheatsheet-layout-qwerty))

;;; Completions

(setup (:elpaca cape)
  (:load-after corfu)
  (:require cape)
  (add-hook 'completion-at-point-functions #'cape-dabbrev))

(setup (:elpaca corfu)
  (:require corfu +corfu)
  (:option tab-always-indent 'complete
	   text-mode-ispell-word-completion nil
	   read-extended-command-predicate #'command-completion-default-include-p)
  (add-hook 'emacs-startup-hook #'global-corfu-mode))

;;; Minibuffer

(setup (:elpaca vertico)
  (:require vertico)
  (:hook-into emacs-startup-hook))

(setup (:elpaca marginalia)
  (:load-after vertico)
  (:require marginalia)
  (:with-mode minibuffer-mode)
  (marginalia-mode 1))

(setup (:elpaca orderless)
  (:load-after corfu vertico)
  (:require orderless)
  (:option completion-styles '(orderless basic)
	   completion-category-defaults nil
	   completion-category-overrides '((file (styles basic)))))

;;; Languages, diagnostics and formatting
;;; TODO:
;;; - Write documentation for Emacs 30+ using treesitter
;;; - Eglot

(setup (:elpaca format-all)
  (:require format-all))
;; C
(setup
    (if (treesit-language-available-p 'c)
        (add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))))

;; CSS
(setup
    (if (treesit-language-available-p 'css)
        (add-to-list 'major-mode-remap-alist '(css-mode . css-ts-mode))))

;; Go
(setup
    (if (treesit-language-available-p 'go)
        (add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))))

;; HTML
(setup
    (if (treesit-language-available-p 'html)
        (add-to-list 'major-mode-remap-alist '(html-mode . html-ts-mode))))

;; Lua
(setup
    (if (treesit-language-available-p 'lua)
        (add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-ts-mode))))

;; Python
(setup
    (if (treesit-language-available-p 'python)
        (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))))

;; Nix
(setup (:elpaca nix-ts-mode :host github :repo "nix-community/nix-ts-mode" :branch "trunk")
  (if (treesit-language-available-p 'nix)
      (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-ts-mode))))

;; Typescript
(setup
    (if (treesit-language-available-p 'typescript)
        (progn
          (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
          (add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode)))))
