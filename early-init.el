;;; early-init.el ---  -*- lexical-binding:t -*-

(setq native-comp-jit-compilation nil
      package-enable-at-startup nil)

(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))

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
