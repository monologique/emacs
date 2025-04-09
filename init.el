;;; init.el --- Summary -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

;;; Default Emacs

(require '+emacs)
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier nil)
;;; Frame

(require '+frame)

;; No title bar on macOS
(when (eq system-type 'darwin)
  (setq ns-use-native-fullscreen t)
  (add-to-list 'default-frame-alist '(undecorated-round . t)))
(tool-bar-mode -1)
(scroll-bar-mode -1)

;;; $PATH
(when (require 'exec-path-from-shell nil t)
  (dolist (var '("SSH_AUTH_SOCK"
                 "SSH_AGENT_PID"
                 "GPG_AGENT_INFO"
                 "LANG"
                 "LC_CTYPE"
                 "GOPATH"
                 "XDG_CONFIG_HOME"
                 "XDG_CONFIG_DIRS"
                 "XDG_DATA_HOME"
                 "XDG_DATA_DIRS"
                 "XDG_CACHE_HOME"))
    (add-to-list 'exec-path-from-shell-variables var))
  (exec-path-from-shell-initialize))

;;; Evil
(when (require 'meow nil t)
  (require '+meow)
  (+meow-setup)
  (meow-global-mode +1))

(when (require 'which-key nil t)
  (setq which-key-max-description-length 40
        which-key-sort-order 'which-key-description-order)

  (add-hook 'after-init-hook #'which-key-mode))

;;; Faces settings

(when (require 'modus-themes nil t)
  (require '+modus-themes)
  (setq modus-themes-italic-constructs nil
        modus-themes-bold-constructs nil
        modus-themes-custom-auto-reload t)
  (when (eq system-type 'darwin)
    (add-hook 'ns-system-appearance-change-functions #'+modus-themes-toggle)))

(when (require 'spacious-padding nil t)
  (add-hook 'window-setup-hook #'spacious-padding-mode))

(when (require 'fontaine nil t)
  (setq fontaine-latest-state-file (.etc "fontaine-latest-state-file.eld")
        fontaine-presets
        '((regular
           :default-family "Aporetic Sans Mono"
           :default-weight normal
           :default-height 160
           
           :fixed-pitch-family "Iosevka Fixed SS14"
           :fixed-pitch-weight nil
           :fixed-pitch-height 1.0

           :fixed-pitch-serif-family "TeX Gyre Termes"

           
           :variable-pitch-family "TeX Gyre Termes"
           :variable-pitch-weight nil
           :variable-pitch-height 1.0
           
           :mode-line-active-family "TeX Gyre Heros"
           :mode-line-active-width nil
           :mode-line-active-height 0.9
           :mode-line-inactive-family "TeX Gyre Heros"
           :mode-line-inactive-width nil
           :mode-line-inactive-height 0.9
           
           :header-line-family "TeX Gyre Heros"
           :tab-bar-family "TeX Gyre Heros"
           :tab-line-family "TeX Gyre Heros"
           )))
  (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular))
  (add-hook 'enable-theme-functions #'fontaine-mode-hook))

(when (require 'ultra-scroll nil t)
  (setq scroll-conservatively 101
        scroll-margin 0)
  (add-hook 'elpaca-after-init-hook #'ultra-scroll-mode))

;;; Completions

(when (require 'corfu nil t)
  (setq tab-always-indent 'complete
	text-mode-ispell-word-completion nil
	read-extended-command-predicate #'command-completion-default-include-p)
  (global-corfu-mode))

(when (require 'cape nil t)
  (add-hook 'completion-at-point-functions #'cape-dabbrev))

;;; Buffer and minibuffer

(when (require 'vertico nil t )
  (add-hook 'after-init-hook #'vertico-mode))

(when (require 'marginalia nil t)
  (add-hook 'vertico-mode-hook #'marginalia-mode))

(when (require 'orderless nil t)
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
	completion-category-overrides '((file (styles basic)))))

(when (require 'helpful nil t)
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key)
  (global-set-key (kbd "C-h x") #'helpful-command))

;;; Note-taking

(when (require 'denote nil t)
  (setq denote-directory (expand-file-name "Documents/Notes" (getenv "HOME"))))

;;; Syntaxes

(when (require 'treesit-auto nil t)
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode +1))

(when (require 'markdown-mode nil t)
  (setq markdown-live-preview-delete-export 'delete-on
        markdown-split-window-direction 'right)
  (add-to-list 'auto-mode-alist
               '("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode)))

;;; Direnv

(when (require 'envrc nil t)
  (global-set-key (kbd "C-c e") #'envrc-command-map)
  (envrc-global-mode +1))

;;; Formatting

(when (require 'format-all nil t)
  (dolist (mode '(bash-ts-mode
                  emacs-lisp-mode
                  nix-ts-mode))
    (add-hook mode #'format-all-mode))

  (add-hook 'bash-ts-mode #'format-all-mode)
  (add-hook 'emacs-lisp-mode #'format-all-mode)
  (add-hook 'nix-ts-mode #'format-all-mode))

;;; Static checking

(when (require 'eglot nil t)
  (add-to-list 'eglot-server-programs
               '((neocaml-mode :language-id "ocaml") . ("ocamllsp")))

  (add-hook 'go-ts-mode #'eglot-ensure)
  (add-hook 'neocaml-mode-hook #'eglot-ensure)
  (add-hook 'rust-ts-mode #'eglot-ensure))

(provide 'init)

;;; init.el ends here
