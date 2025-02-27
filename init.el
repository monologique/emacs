;;; init.el --- Summary -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:

;; List of files and directories whose content we trust.
(add-to-list 'trusted-content (concat user-emacs-directory "early-init.el"))
(add-to-list 'trusted-content (concat user-emacs-directory "lisp/"))

;; List of directories to search for files to load.
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; Core
(require 'init-utils)
(require 'init-defaults)
(require 'init-elpaca)
(require 'init-keybindings)
(require 'init-theming)
(require 'init-minibuffer)
(require 'init-editing)

;; Remote
(require 'init-remote)

;; Misc
(require 'init-uniquify)
(require 'init-ultra-scroll)

;; Static checking and formating

(require 'init-eglot)
(require 'init-flymake)
(require 'init-direnv)

;; Languages

(require 'init-treesitter)
(require 'init-format-all)
(require 'init-yaml)
(require 'init-nix)
(require 'init-markdown)

;;; init.el ends here
