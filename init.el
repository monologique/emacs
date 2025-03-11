;;; init.el --- Summary -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(setup (:require +emacs)
  ;; macOS-specifics settings
  (setq mac-option-key-is-meta nil
        mac-command-key-is-meta t
        mac-command-modifier 'meta
        mac-option-modifier nil))

;;; Keybindings
(setup (:require meow +meow)
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)

  (+meow-setup)

  (add-hook 'after-init-hook #'meow-global-mode))

(setup (:require which-key)
  (setq which-key-max-description-length 40
        which-key-sort-order 'which-key-description-order)
  (add-hook 'meow-global-mode-hook #'which-key-mode))

;;; Frame and faces settings

(setup (:require +frame)
  ;; Set up frame appearance at startup
  (add-hook 'emacs-startup-hook #'+frame-center-2/3)
  (add-hook 'window-setup-hook #'raise-frame)

  ;; No title bar on macOS
  (when (eq system-type 'darwin)
    (setq ns-use-native-fullscreen t)
    (add-to-list 'default-frame-alist '(undecorated-round . t)))

  ;; Disable toolbars and scrollbars
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(setup (:require modus-themes +modus-themes)
  (setq modus-themes-italic-constructs nil
        modus-themes-bold-constructs nil
        modus-themes-custom-auto-reload t)

  (when (eq system-type 'darwin)
    (add-hook 'ns-system-appearance-change-functions #'+modus-themes-toggle)))

(setup (:require spacious-padding)
  (add-hook 'after-init-hook #'spacious-padding-mode))

(setup (:require fontaine)
  (setq fontaine-latest-state-file (.etc "fontaine-latest-state-file.eld")
        fontaine-presets
        '((regular
	   :default-family "Iosevka Fixed SS14"
	   :default-weight normal
	   :default-height 160
	   :fixed-pitch-family "Iosevka Fixed SS14"
	   :fixed-pitch-weight nil
           :fixed-pitch-height 1.0
	   :variable-pitch-family "Times New Roman"
	   :variable-pitch-weight nil
           :variable-pitch-height 1.2
           :mode-line-active-family "Helvetica"
           :mode-line-active-width nil
           :mode-line-active-height 0.9
           :mode-line-inactive-family "Helvetica"
           :mode-line-inactive-width nil
           :mode-line-inactive-height 0.9)))
  (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular))
  (add-hook 'enable-theme-functions #'fontaine-mode))

(setup (:require ultra-scroll)
  (setq scroll-conservatively 101
	scroll-margin 0)

  (add-hook 'after-init-hook #'ultra-scroll-mode))

;;; Completions

(setup (:require cape)
  (add-hook 'completion-at-point-functions #'cape-dabbrev))

(setup (:require corfu +corfu)
  (setq tab-always-indent 'complete
	text-mode-ispell-word-completion nil
	read-extended-command-predicate #'command-completion-default-include-p)
  (add-hook 'emacs-startup-hook #'global-corfu-mode))

;;; Buffer and minibuffer

(setup (:require vertico)
  (add-hook 'after-init-hook #'vertico-mode))

(setup (:require marginalia)
  (with-eval-after-load 'vertico
    (add-hook 'vertico-mode-hook #'marginalia-mode)))

(setup (:require orderless)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
	completion-category-overrides '((file (styles basic)))))

(setup (:require helpful)
  (:global "C-h f" #'helpful-callable
           "C-h v" #'helpful-variable
           "C-h k" #'helpful-key
           "C-h x" #'helpful-command))

;;; Note-taking

(setup (:require denote)
  (setq denote-directory (expand-file-name "Documents/Notes" (getenv "HOME"))))

;;; Languages, diagnostics and formatting
;; TODO:
;; - Write documentation for Emacs 30+ using treesitter
;; - Eglot

(setup (:require format-all)
  (add-hook 'prog-mode-hook #'format-all-mode))

(setup (:require envrc)
  (add-hook 'after-init-hook #'envrc-global-mode))

;; (setup (:require direnv)
;;   (add-hook 'after-init-hook #'direnv-mode))
;; ;; C
;; (setup
;;     (if (treesit-language-available-p 'c)
;;         (add-to-list 'major-mode-remap-alist '(c-mode . c-ts-mode))))

;; ;; ;; CSS
;; ;; (setup
;; ;;     (if (treesit-language-available-p 'css)
;; ;;         (add-to-list 'major-mode-remap-alist '(css-mode . css-ts-mode))))

;; ;; ;; Go
;; ;; (setup
;; ;;     (if (treesit-language-available-p 'go)
;; ;;         (add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))))

;; ;; ;; HTML
;; ;; (setup
;; ;;     (if (treesit-language-available-p 'html)
;; ;;         (add-to-list 'major-mode-remap-alist '(html-mode . html-ts-mode))))

;; ;; ;; Lua
;; ;; (setup
;; ;;     (if (treesit-language-available-p 'lua)
;; ;;         (add-to-list 'auto-mode-alist '("\\.lua\\'" . lua-ts-mode))))

;; ;; ;; Python
;; ;; (setup
;; ;;     (if (treesit-language-available-p 'python)
;; ;;         (add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))))

;; Nix
(setup (:package nix-ts-mode)
  (if (treesit-language-available-p 'nix)
      (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-ts-mode))))

;; ;; ;; Typescript
;; ;; (setup
;; ;;     (if (treesit-language-available-p 'typescript)
;; ;;         (progn
;; ;;           (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
;; ;;           (add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode)))))
