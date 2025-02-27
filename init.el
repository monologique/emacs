;;; init.el
(defvar my/org-path "~/Documents/Org"
  "Directory for Org.")

(defvar my/notes-path "~/Documents/Org/roam"
  "Directory of my notes using Org roam.")

(defvar my/font-default-family "Iosevka Comfy"
  "Just my default font.")

(defvar my/font-variable-pitch-family "Iosevka Comfy"
  "Just my default font.")

(defconst my/font-sans-family "SF Pro"
  "Just my default font.")

(add-to-list 'load-path "~/.emacs.d/lisp")

;; Core
(require 'init-elpaca)
(require 'init-defaults)

;; Graphic change
(require 'init-layouts)
(require 'init-modus-themes)
(require 'init-fontaine)

;; Key functionality
(require 'init-evil)

;; Editing and movement
(require 'init-electric)

;; Completions
(require 'init-corfu)

;; Minibuffer
(require 'init-vertico)

;; Org
(require 'init-org)
(require 'init-denote)

;; Misc
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

;;; init.el ends here
