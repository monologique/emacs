;;; +setup.el --- -*- lexical-binding: t -*-

;; * MACROS

;; ** Deferred Loading

(setup-define :load-after
    (lambda (&rest features)
      (let ((body `(require ',(setup-get 'feature))))
        (dolist (feature (nreverse features))
          (setq body `(with-eval-after-load ',feature ,body)))
        body))
    :documentation "Load the current feature after FEATURES.")

;; ** Customizing face

(setup-define :face
  (lambda (face spec) `(custom-set-faces (quote (,face ,spec))))
  :documentation "Customize FACE to SPEC."
  :signature '(face spec ...)
  :debug '(setup)
  :repeatable t
  :after-loaded t)

;; ** Specify auto-mode-alist with globs

(setup-define :file-match
  (lambda (glob)
    `(add-to-list 'auto-mode-alist (cons ,(wildcard-to-regexp glob) ',(setup-get 'mode))))
  :documentation "Associate the current mode with files that match GLOB."
  :debug '(form)
  :repeatable t)

(provide '+setup)
;;; +setup.el ends here
