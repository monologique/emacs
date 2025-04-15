;;; early-init.el --- Summary -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

;; Hide native comp warnings
(setq native-comp-jit-compilation nil)

;; Disable package.el
(setq package-enable-at-startup nil)

(add-to-list 'load-path (locate-user-emacs-file "lisp"))

(require 'functions)

(+define-dir .etc (locate-user-emacs-file ".etc")
  "Directory for all of Emacs's various files.
See `no-littering' for examples.")

;;; No littering

(setq no-littering-etc-directory .etc
      no-littering-var-directory .etc)

(when (boundp 'comp-eln-load-path)
  (setcar comp-eln-load-path (exand-file-name (.etc "eln-cache" t))))

;; Load Elpaca
(require '+elpaca)

(elpaca-wait)
(elpaca no-littering)
(elpaca-wait)

(provide 'early-init)
;;; early-init.el ends here
