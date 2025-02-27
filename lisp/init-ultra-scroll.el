;;; init-ultra-scroll.el --- Summary -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:

;; Better scrolling which give a modern feeling for Emacs
(use-package ultra-scroll
  :ensure (:repo "https://github.com/jdtsmith/ultra-scroll")
  :init
  (setq scroll-conservatively 101 ; important!
        scroll-margin 0)
  :config
  (ultra-scroll-mode +1))

(provide 'init-ultra-scroll)
;;; init-ultra-scroll.el ends here
