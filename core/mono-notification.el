(elpaca popon
  (require 'popon))

(defun +mono-notify (text &optional timeout)
  "Affiche une notification en bas à droite et la supprime après TIMEOUT secondes."
  (let* ((win (selected-window))
         (fixed-width (/ (window-width win) 6))
         (lines (split-string text "\n")))
    ;; Crée la popon et capture-la dans une variable locale
    (let ((popon-obj (popon-create
                      (cons text fixed-width)
                      (cons (- (window-width win) fixed-width 1)
                            (- (window-height win) (length lines) 1))
                      win nil 100)))
      ;; Pass popon-obj explicitement à la lambda via une closure lexicale
      (overlay-put popon-obj 'face '(:background "#333333" :foreground "white"
						 :box (:line-width 10 :color "#333333" :style rounded-button)))
      (overlay-end

      (when timeout
        (run-with-timer
         timeout nil
         (lambda (popon)
	   (popon-kill popon)
             (popon-kill popon))
         popon-obj)))))  ; <-- Ici on passe popon-obj comme argument

(defun +mono-notify-with-rounded-corners (text &optional timeout)
  (let* ((win (selected-window))
         (fixed-width (/ (window-width win) 4))
         (lines (split-string text "\n"))
         (popon (popon-create
                 (concat
                  (propertize " " 'display '(left-fringe right-round-corner nil))
                  text
                  (propertize " " 'display '(right-fringe left-round-corner nil)))
                 (cons (- (window-width win) fixed-width 1)
                       (- (window-height win) (length lines) 1))
                 win nil 100)))
    ;; Style de l'overlay : fond + bordure arrondie (simulée)
    (overlay-put popon 'face '(:background "#333333" :foreground "white"
                               :box (:line-width 10 :color "#333333" :style rounded-button)))
    (when timeout
      (run-with-timer timeout nil (lambda () (popon-delete popon))))))

(provide 'mono-notification)
