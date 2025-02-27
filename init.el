;;; init.el --- Summary -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:

;; Loading the theme first
(require 'init-theming)
;; Key functionality
(require 'init-general)
(require 'init-which-key)
(require 'init-meow)
(require 'init-editing)
(require 'init-completion)
(require 'init-minibuffer)

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
(require 'init-markdown)

;; Remote
(require 'init-remote)

;; Misc
(require 'init-uniquify)
(require 'init-ultra-scroll)
;;; init.el ends here
