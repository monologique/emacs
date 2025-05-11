;;; mono-early-init.el --- -*- lexical-binding: t -*-

;;; Code:

(elpaca fontaine
  (require 'fontaine)
  
  (with-eval-after-load 'fontaine
    (setq fontaine-latest-state-file (expand-file-name "fontaine-latest-state-file.eld" user-emacs-directory))

    (setq fontaine-presets
          '((regular
             :default-family "Iosevka SS15"
             :default-height 160
             :default-weight regular

             :mode-line-active-family "sans"
             :mode-line-active-height 0.9

             :mode-line-inactive-family "sans"
             :mode-line-inactive-height 0.9)))
          
    (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular))
    (add-hook 'enable-theme-functions #'fontaine-mode)))

(provide 'mono-face)
