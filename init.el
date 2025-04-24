;;; init.el --- Summary -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

;;; Default Emacs

(use-package emacs
  :ensure nil
  :config
  (require '+emacs)
  (require '+machines)
  (require '+frame))

(elpaca-wait)

;;; Shell

(use-package exec-path-from-shell
  :config
  (when (require 'exec-path-from-shell nil t)
    (dolist (var '("GOPATH"
                   "GPG_AGENT_INFO"
                   "LANG"
                   "LC_CTYPE"
                   "NIX_PATH"
                   "NIX_SSL_CERT_FILE"
                   "SSH_AUTH_SOCK"
                   "SSH_AGENT_PID"
                   "XDG_CONFIG_HOME"
                   "XDG_CONFIG_DIRS"
                   "XDG_DATA_HOME"
                   "XDG_DATA_DIRS"
                   "XDG_CACHE_HOME"))
      (add-to-list 'exec-path-from-shell-variables var))

    (when (daemonp)
      (exec-path-from-shell-initialize))

    (when (display-graphic-p)
      (exec-path-from-shell-initialize))))

;;; Keybinds and movements

(use-package meow
  :init
  (setq meow-cheatsheet-physical-layout 'meow-cheatsheet-layout-qwerty)
  :config
  (require '+meow)
  (+meow-setup)
  (meow-global-mode +1))

(use-package which-key
  :config
  (setq which-key-max-description-length 40
        which-key-sort-order 'which-key-description-order)

  (add-hook 'elpaca-after-init-hook #'which-key-mode))

;;; Faces settings

(use-package modus-themes
  :init
  (setq modus-themes-italic-constructs nil
        modus-themes-bold-constructs nil
        modus-themes-custom-auto-reload t)
  :config
  (require '+modus-themes)

  (when (eq system-type 'darwin)
    (add-hook 'ns-system-appearance-change-functions #'+modus-themes-toggle))

  (add-hook 'elpaca-after-init-hook '(lambda () (+modus-themes-toggle 'ns-system-appearance))))

(use-package spacious-padding
  :config
  (add-hook 'enable-theme-functions #'spacious-padding-mode))

(use-package fontaine
  :init
  (setq fontaine-latest-state-file (.etc "fontaine-latest-state-file.eld"))

  (*machine-if
   (+machine-fontaine-set-preset)

   (setq fontaine-presets
         '((regular
            :default-family "Monospace"
            :default-height 140
            :default-weight normal))))
  :config
  (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular))
  (add-hook 'enable-theme-functions #'fontaine-mode))

;;; Completions

(use-package corfu
  :init
  (setq tab-always-indent 'complete
	text-mode-ispell-word-completion nil
	read-extended-command-predicate #'command-completion-default-include-p)
  :config
  (global-corfu-mode 1))

(use-package cape
  :after corfu
  :config
  (add-hook 'completion-at-point-functions #'cape-dabbrev))

;;; Buffer and minibuffer

(use-package vertico
  :config
  (add-hook 'elpaca-after-init-hook #'vertico-mode))

(use-package marginalia
  :after vertico
  :config
  (add-hook 'vertico-mode-hook #'marginalia-mode))

(use-package orderless
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
	completion-category-overrides '((file (styles basic)))))

;;; Better help buffers

(use-package helpful
  :init
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key)
  (global-set-key (kbd "C-h x") #'helpful-command))

;;; Note-taking

(use-package denote
  :init
  (setq denote-directory (expand-file-name "Documents/Notes" (getenv "HOME"))))

(use-package markdown-mode
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.\\(?:md\\|markdown\\|mkd\\|mdown\\|mkdn\\|mdwn\\)\\'" . markdown-mode))
  :init
  (setq markdown-live-preview-delete-export 'delete-on
        markdown-split-window-direction 'right))

;;; VCS
(use-package transient)

(elpaca-wait)

(use-package magit
  :after transient
  :init
  (setq magit-define-global-key-bindings 'recommanded))

;;; Syntax
;; TODO: Implementating auto-mode-remap for language like lua without
;; installating lua-mode for example
;; Create a use-package for each language supported
(use-package treesit
  :if (>= emacs-major-version 30)
  :ensure nil
  :init
  (setq treesit-font-lock-level 4)
  :config
  (require '+treesit)

  (+treesit-populate-major-mode-remap))

(use-package neocaml
  :ensure (:host github :repo "bbatsov/neocaml")
  :config
  (add-hook 'neocaml-mode-hook #'neocaml-repl-minor-mode)
  (add-to-list 'eglot-server-programs '((neocaml-mode :language-id "ocaml") . ("ocamllsp"))))

;;; Direnv
(use-package envrc
  :init
  (global-set-key (kbd "C-c e") #'envrc-command-map)
  :config
  (add-hook 'elpaca-after-init-hook #'envrc-global-mode))

;;; Formatting
(use-package format-all
  :config
  (add-hook 'bash-ts-mode #'format-all-mode)
  (add-hook 'emacs-lisp-mode #'format-all-mode))

;;; Static checking

(use-package eglot
  :ensure nil
  :config
  (add-to-list 'eglot-server-programs
               '((neocaml-mode :language-id "ocaml") . ("ocamllsp")))

  (add-hook 'go-ts-mode #'eglot-ensure)
  (add-hook 'neocaml-mode-hook #'eglot-ensure)
  (add-hook 'rust-ts-mode #'eglot-ensure))

;;; Misc
(use-package ultra-scroll
  :ensure (:host github :repo "jdtsmith/ultra-scroll" :branch "main")
  :init
  (setq scroll-conservatively 101
        scroll-margin 0)
  :config
  (add-hook 'elpaca-after-init-hook #'ultra-scroll-mode))

(use-package fish-mode
  :mode ("\\.fish\\'" . fish-mode)
  :config
  (with-eval-after-load 'format-all
    (add-hook 'fish-mode-hook #'format-all-mode)))

(provide 'init)
;;; init.el ends here
