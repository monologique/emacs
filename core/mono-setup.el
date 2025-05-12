;;; mono-setup.el --- -*- lexical-binding: t -*-

;;; Code:

(elpaca setup (require 'setup))
(elpaca-wait)

;;; --- Macros

(defun setup-wrap-to-install-package (body _name)
"Wrap BODY in an `elpaca' block if necessary.
The body is wrapped in an `elpaca' block if `setup-attributes'
contains an alist with the key `elpaca'."
(if (assq 'elpaca setup-attributes)
    `(elpaca ,(cdr (assq 'elpaca setup-attributes)) ,@(macroexp-unprogn body))
  body))
;; Add the wrapper function
(add-to-list 'setup-modifier-list #'setup-wrap-to-install-package)

(setup-define :elpaca
  (lambda (order &rest recipe)
    (push (cond
	   ((eq order t) `(elpaca . ,(setup-get 'feature)))
	   ((eq order nil) '(elpaca . nil))
	   (`(elpaca . (,order ,@recipe))))
	  setup-attributes)
    ;; If the macro wouldn't return nil, it would try to insert the result of
    ;; `push' which is the new value of the modified list. As this value usually
    ;; cannot be evaluated, it is better to return nil which the byte compiler
    ;; would optimize away anyway.
    nil)
  :documentation "Install ORDER with `elpaca'.
The ORDER can be used to deduce the feature context."
  :shorthand #'cadr)

(provide 'mono-setup)
