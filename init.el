
(defvar my/org-path "~/Documents/Org"
  "Directory for Org.")

(defvar my/notes-path "~/Documents/Org/roam"
  "Directory of my notes using Org roam.")

(add-to-list 'load-path "~/.emacs.d/lisp")

;; Core
(require 'init-elpaca)
(require 'init-defaults)

;; Graphic change
(require 'init-layouts)
(require 'init-modus-themes)
(require 'init-fontaine)
(require 'init-ns-auto-titlebar)

;; Key functionality
(require 'init-evil)

;; Editing and movement
(require 'init-electric)

;; Completions
(require 'init-corfu)

;; Org
(require 'init-org)
(require 'init-org-modern)

;; Misc
(require 'init-ultra-scroll)
(require 'init-uniquify)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
