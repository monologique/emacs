;;; init.el --- Summary -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:

(require 'init-theming)
(require 'init-keybindings)
(require 'init-editing)
(require 'init-minibuffer)

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
