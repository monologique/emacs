;;; mono-init.el --- -*- lexical-binding: t -*-

(defconst mono-start-time (current-time))
            
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier nil)

(select-frame-set-input-focus (selected-frame))

(provide 'mono-init)
;;; mono-init.el ends here
