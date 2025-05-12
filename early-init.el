;;; early-init.el ---  -*- lexical-binding:t -*-

(add-to-list 'load-path (expand-file-name "core" user-emacs-directory))

(require 'mono-lib)
(require 'mono-path)
(require 'mono-version)
(require 'mono-defaults)
(require 'mono-frame)
(require 'mono-setup)
