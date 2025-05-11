;;; early-init.el ---  -*- lexical-binding:t -*-

(setq native-comp-jit-compilation nil
      package-enable-at-startup nil)

(load (expand-file-name "app/mono-early-init.el" user-emacs-directory)
      nil (not init-file-debug))
