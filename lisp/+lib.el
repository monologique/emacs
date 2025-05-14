;;; +lib.el --- -*- lexical-binding:t -*-

;;; Code:
(defmacro +define-directory (name directory &optional docstring inhibit-mkdir)
  "Define a variable and function NAME expanding to DIRECTORY.
DOCSTRING is applied to the variable.  Ensure DIRECTORY exists in
the filesystem, unless INHIBIT-MKDIR is non-nil."
  (declare (indent 2)
           (doc-string 3))
  (unless inhibit-mkdir
    (make-directory (eval directory) :parents))
  `(progn
     (defvar ,name ,directory
       ,(concat docstring (when docstring "\n")
                "Defined by `+define-directory'."))
     (defun ,name (file &optional mkdir)
       ,(concat "Expand FILE relative to variable `" (symbol-name name) "'.\n"
                "If MKDIR is non-nil, the directory is created.\n"
                "Defined by `/define-dir'.")
       (let ((file-name (expand-file-name (convert-standard-filename file)
                                          ,name)))
         (when mkdir
           (make-directory (file-name-directory file-name) :parents))
         file-name))))

(provide '+lib)
;;; +lib.el ends here