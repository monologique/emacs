;;; init-utils.el --- Summary -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:

(defun my/frame-center ()
  "Center the current frame."
  (interactive)
  (let* ((dw (display-pixel-width))
	 (dh (display-pixel-height))
	 (f  (selected-frame))
	 (fw (frame-pixel-width f))
	 (fh (frame-pixel-height f))
	 (x  (- (/ dw 2) (/ fw 2)))
	 (y  (- (/ dh 2) (/ fh 2))))
    (set-frame-position f x y)))

(provide 'init-utils)
;;; init-utils.el ends here
