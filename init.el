;;; init.el --- Summary -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:

;; Loading the theme first
(require 'init-fontaine)
(require 'init-icons)
(require 'init-theme)

;; Key functionality
(require 'init-general)
(require 'init-which-key)

;; Editing and movement
(require 'init-meow)
(require 'init-editing)

;; Completions
(require 'init-corfu)

;; Minibuffer
(require 'init-vertico)

;; Note-taking
(require 'init-denote)

;; VCS
(require 'init-magit)

;; Static checking and formating
(require 'init-eglot)
(require 'init-flymake)
(require 'init-direnv)

;; Languages
(require 'init-treesitter)
(require 'init-format-all)
(require 'init-yaml)
(require 'init-nix)

;; Remote
(require 'init-remote)

;; Misc
(require 'init-uniquify)
(require 'init-ultra-scroll)
;;; init.el ends here
