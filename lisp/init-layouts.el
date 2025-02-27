;;; init-layouts.el

;;; Commentary:

;;; Code:

(defun frame-center ()
  "Center the current frame."
  (interactive)
  (let* ((dw (display-pixel-width))
         (dh (display-pixel-height))
         (f  (selected-frame))
         (fw (frame-pixel-width f))
         (fh (frame-pixel-height f))
         (x  (- (/ dw 2) (/ fw 2)))
         (y  (- (/ dh 2) (/ fh 2))))
    (message (format "dw %d dh %d fw %d fh %d x %d y %d" dw dh fw fh x y))
    (set-frame-position f x y)))

(use-package emacs
  :ensure nil
  :config
  (add-to-list 'default-frame-alist '((internal-border-width . 10)))
  (add-hook 'emacs-startup-hook #'frame-center))


;; Better scrolling which give a modern feeling for Emacs
(use-package ultra-scroll
  :ensure (:repo "https://github.com/jdtsmith/ultra-scroll")
  :init
  (setq scroll-conservatively 101 ; important!
        scroll-margin 0) 
  :config
  (ultra-scroll-mode +1))

(provide 'init-ultra-scroll)


;; Make the titlebar follow the system appearance
(use-package ns-auto-titlebar
  :init
  ;; Hide frame name for sleek window
  (setq-default frame-title-format "")
  :config
  (when (eq system-type 'darwin) (ns-auto-titlebar-mode)))

(provide 'init-layouts)
;;; init-layouts.el ends here
