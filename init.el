;;; init.el --- monologique init file  -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defconst mono-start-time (current-time))
            
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier nil)

(load (mono-modules-directory "+completion.el"))
(load (mono-modules-directory "+dired"))
(load (mono-modules-directory "+version-control"))
(load (mono-modules-directory "+notes"))
(load (mono-modules-directory "+org"))
(load (mono-modules-directory "+evil"))

(select-frame-set-input-focus (selected-frame))
