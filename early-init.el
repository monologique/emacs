;;; early-init.el --- Summary -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

;; Disable package.el since we use elpaca
(setq package-enable-at-startup nil)

;; Hide native comp warnings
(setq native-comp-jit-compilation nil)

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
;;; early-init.el ends here
