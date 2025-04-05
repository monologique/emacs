;;; init.el --- Summary -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(setup (:require +emacs)
  (setq mac-option-key-is-meta nil
        mac-command-key-is-meta t
        mac-command-modifier 'meta
        mac-option-modifier nil))

(setup (:require +frame)
  (add-hook 'elpaca-after-init-hook #'+frame-center-2/3)
  (add-hook 'elpaca-after-init-hook #'raise-frame)
  ;; No title bar on macOS
  (when (eq system-type 'darwin)
    (setq ns-use-native-fullscreen t)
    (add-to-list 'default-frame-alist '(undecorated-round . t)))

  ;; Disable toolbars and scrollbars
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(setup (:require exec-path-from-shell)
  (dolist (var '("SSH_AUTH_SOCK"
                 "SSH_AGENT_PID"
                 "GPG_AGENT_INFO"
                 "LANG"
                 "LC_CTYPE"
                 "XDG_CONFIG_HOME"
                 "XDG_CONFIG_DIRS"
                 "XDG_DATA_HOME"
                 "XDG_DATA_DIRS"
                 "XDG_CACHE_HOME"))
    (add-to-list 'exec-path-from-shell-variables var))
  (exec-path-from-shell-initialize))

(setup (:require meow +meow)
  (:option meow-cheatsheet-physical-layout meow-cheatsheet-physical-layout-ansi)
  (+meow-setup)
  (meow-global-mode))

(setup (:package which-key)
  (:option which-key-max-description-length 40
           which-key-sort-order 'which-key-description-order)
  (add-hook 'after-init-hook #'which-key-mode))

;;; Frame and faces settings

(setup (:require modus-themes +modus-themes)
  (setq modus-themes-italic-constructs nil
        modus-themes-bold-constructs nil
        modus-themes-custom-auto-reload t)
  (when (eq system-type 'darwin)
    (add-hook 'ns-system-appearance-change-functions #'+modus-themes-toggle)))

(setup (:require spacious-padding)
  (add-hook 'window-setup-hook #'spacious-padding-mode))

(setup (:require fontaine)
  (setq fontaine-latest-state-file (.etc "fontaine-latest-state-file.eld")
        fontaine-presets
        '((regular
	   :default-family "Aporetic Sans Mono"
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
  (add-hook 'enable-theme-functions #'fontaine-mode-hook))

(setup (:require ultra-scroll)
  (setq scroll-conservatively 101
        scroll-margin 0)
  (add-hook 'elpaca-after-init-hook #'ultra-scroll-mode))

;;; Completions

(setup (:require corfu +corfu)
  (setq tab-always-indent 'complete
	text-mode-ispell-word-completion nil
	read-extended-command-predicate #'command-completion-default-include-p)
  (global-corfu-mode))

(setup (:require cape)
  (add-hook 'completion-at-point-functions #'cape-dabbrev))

;;; Buffer and minibuffer

(setup (:require vertico)
  (add-hook 'after-init-hook #'vertico-mode))

(setup (:require marginalia)
  (:hook-into vertico-mode))

(setup (:require orderless)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
	completion-category-overrides '((file (styles basic)))))

(setup (:require helpful)
  (:bind "C-h f" #'helpful-callable
         "C-h v" #'helpful-variable
         "C-h k" #'helpful-key
         "C-h x" #'helpful-command))

;;; Note-taking

(setup (:require denote)
  (setq denote-directory (expand-file-name "Documents/Notes" (getenv "HOME"))))

;;; Formating and snippets

(setup (:require format-all)
  (:hook-into prog-mode))

;;; Treesitter
(setup treesit
  (:option treesit-font-lock-level 4))

(setup go-ts-mode
  (if (treesit-language-available-p 'go)
      (progn
        (add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))
        (add-to-list 'auto-mode-alist '("go\\.mod\\'" . go-mod-ts-mode)))))

(setup nix-ts-mode
  (if (treesit-language-available-p 'nix)
      (add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-ts-mode))))

;;; Static checking
