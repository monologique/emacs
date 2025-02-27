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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("7c28419e963b04bf7ad14f3d8f6655c078de75e4944843ef9522dbecfcd8717d"
     "34cf3305b35e3a8132a0b1bdf2c67623bc2cb05b125f8d7d26bd51fd16d547ec"
     default))
 '(package-selected-packages nil)
 '(warning-suppress-types '((use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((((class color) (min-colors 256)) :inherit 'fixed-pitch :weight normal)))
 '(org-level-1 ((((class color) (min-colors 256)) :weight bold :height 1.5)))
 '(org-level-2 ((((class color) (min-colors 256)) :weight bold :height 1.25)))
 '(org-level-3 ((((class color) (min-colors 256)) :weight bold :height 1.175)))
 '(org-level-4 ((((class color) (min-colors 256)) :weight bold :height 1.125)))
 '(org-level-5 ((((class color) (min-colors 256)) :weight bold :height 1.1)))
 '(org-level-6 ((((class color) (min-colors 256)) :weight bold :height 1.1)))
 '(org-level-7 ((((class color) (min-colors 256)) :weight bold :height 1.1)))
 '(org-level-8 ((((class color) (min-colors 256)) :weight bold :height 1.1))))
;;; init.el ends here
