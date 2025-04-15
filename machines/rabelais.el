;;; rabelais.el --- Summary -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun +machine-fontaine-set-preset ()
  "Sets custom preset for machine."
  (setq fontaine-presets
        '((regular
           :default-family "Iosevka SS15"
           :default-height 140
           :default-weight regular

           :mode-line-active-family "SF Pro"
           :mode-line-active-height 0.9

           :mode-line-inactive-family "SF Pro"
           :mode-line-inactive-height 0.9))))

(provide 'rabelais)
;;; rabelais.el ends here
