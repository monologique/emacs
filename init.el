;;; init.el --- monologique init file  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defconst mono-start-time (current-time))
            
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier nil)

(load (mono-modules-directory "+fontaine"))
(load (mono-modules-directory "+modus-themes"))
(load (mono-modules-directory "+completion"))
(load (mono-modules-directory "+coding"))
(load (mono-modules-directory "+org"))
(load (mono-modules-directory "+denote"))
(load (mono-modules-directory "+popper"))
(load (mono-modules-directory "+version-control"))

(select-frame-set-input-focus (selected-frame))
