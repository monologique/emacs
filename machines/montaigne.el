;;; montaigne.el --- Summary -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

;;; Frame

(tool-bar-mode -1)
(scroll-bar-mode -1)

;;; Key configuration

(when (eq system-type 'darwin)
  (setq mac-option-key-is-meta nil
        mac-command-key-is-meta t
        mac-command-modifier 'meta
        mac-option-modifier nil))

;; No title bar on macOS
(when (eq system-type 'darwin)
  (setq ns-use-native-fullscreen t)
  (add-to-list 'default-frame-alist '(undecorated-round . t)))

;;; Fontaine

(defun +machine-fontaine-set-preset ()
  "Sets custom preset for machine."
  (setq fontaine-presets
        '((regular
           :default-family "Iosevka SS15"
           :default-height 160
           :default-weight regular

           :mode-line-active-family "SF Pro"
           :mode-line-active-height 0.9

           :mode-line-inactive-family "SF Pro"
           :mode-line-inactive-height 0.9))))

(provide 'montaigne)
;;; montaigne.el ends here
