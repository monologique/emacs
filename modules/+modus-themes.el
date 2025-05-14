;;; theme.el --- -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(setup (:package modus-themes)
  (require 'modus-themes)

  (mapc #'disable-theme custom-enabled-themes)
  
  (with-eval-after-load 'modus-themes
    (setq modus-themes-italic-constructs nil
          modus-themes-bold-constructs nil
          modus-themes-custom-auto-reload t
	  modus-themes-variable-pitch-ui t)
    
    (setq modus-themes-common-palette-overrides
          modus-themes-preset-overrides-faint)

    (setq modus-themes-common-palette-overrides
      '((fg-line-number-inactive "gray50")
        (fg-line-number-active fg-main)
        (bg-line-number-inactive unspecified)
        (bg-line-number-active unspecified)))

    (modus-themes-load-theme 'modus-operandi)))
