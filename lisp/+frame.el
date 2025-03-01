;;; +frame.el --- Summary -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defun +frame-center-2/3 ()
  "Center the Emacs frame and resize it to 2/3 of the screen."
  (interactive)
  (when window-system
    (let* ((display-width (display-pixel-width))
           (display-height (display-pixel-height))
           (frame-width (floor (* display-width 0.66)))  ;; 2/3 of screen width
           (frame-height (floor (* display-height 0.66))) ;; 2/3 of screen height
           (pos-x (/ (- display-width frame-width) 2))   ;; Center horizontally
           (pos-y (/ (- display-height frame-height) 4))) ;; Raise slightly

      (set-frame-position (selected-frame) pos-x pos-y)
      (set-frame-size (selected-frame) frame-width frame-height t))))

(provide '+frame)
;;; +frame.el ends here
