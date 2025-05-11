;;; mono-early-init.el --- -*- lexical-binding: t -*-

;;; Code:

(add-to-list 'load-path (expand-file-name "app" user-emacs-directory))

(setq package-enable-at-startup nil
      native-comp-jit-compilation nil)

(require 'mono-lib)
(require 'mono-path)
(require 'mono-version)
(require 'mono-elpaca)
(require 'mono-defaults)
(require 'mono-frame)
(elpaca-wait)
(require 'mono-setup)
(elpaca-wait)
(require 'mono-theme)
(require 'mono-face)

;;; mono-early-init.el ends here
