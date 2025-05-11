;;; theme.el --- -*- lexical-binding:t -*-
(setup (:elpaca modus-themes)
  (require 'modus-themes)
  
  (with-eval-after-load 'modus-themes
    (setq modus-themes-italic-constructs nil
          modus-themes-bold-constructs nil
          modus-themes-custom-auto-reload t
	  modus-themes-variable-pitch-ui t)
    
    (setq modus-themes-common-palette-overrides
          modus-themes-preset-overrides-cooler)

    (load-theme 'modus-vivendi t nil)))

(provide 'mono-theme)
