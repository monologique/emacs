;;; init.el --- monologique init file  -*- lexical-binding:t -*-
;;

;;; Code:
(require 'mono-init)
;; TODO: Conditional loading
(load (mono-modules-directory "+meow.el"))
(load (mono-modules-directory "+completion.el"))
(load (mono-modules-directory "+dired"))
(load (mono-modules-directory "+version-control"))
(load (mono-modules-directory "+notes"))
