;;; mono-frame.el --- -*- lexical-binding: t -*-

;;; Code:
(setq frame-title-format nil)

(setq default-frame-alist
      (append (list
               '(min-height . 1)  '(height . 45)
               '(min-width  . 1)  '(width  . 81)
               '(vertical-scroll-bars . nil)
               '(internal-border-width . 24)
               '(left-fringe . 0)
               '(right-fringe . 0)
               '(undecorated-round . t)
               '(scroll-bar-mode . -1)
               '(tool-bar-lines . 0)
               '(menu-bar-lines . 0))))

;; --- Windows ---
(setq window-divider-default-right-width 24
      window-divider-default-places 'right-only)

(window-divider-mode 1)

(setq-default pop-up-windows nil)

(provide 'mono-frame)
;;; mono-frame.el ends here
