;;; early-init.el --- Summary -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(defvar +emacs--startup-restore-alist nil
  "Variables and values to restore after init.")

;; Hide native comp warnings
(setq native-comp-jit-compilation nil)

(push (locate-user-emacs-file "lisp") load-path)

(require 'functions)

(defmacro +define-dir (name directory &optional docstring inhibit-mkdir)
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
                "Defined by `/define-dir'."))
     (defun ,name (file &optional mkdir)
       ,(concat "Expand FILE relative to variable `" (symbol-name name) "'.\n"
                "If MKDIR is non-nil, the directory is created.\n"
                "Defined by `/define-dir'.")
       (let ((file-name (expand-file-name (convert-standard-filename file)
                                          ,name)))
         (when mkdir
           (make-directory (file-name-directory file-name) :parents))
         file-name))))

(+define-dir .etc (locate-user-emacs-file ".etc")
  "Directory for all of Emacs's various files.
See `no-littering' for examples.")

;;; No littering

(setq no-littering-etc-directory .etc
      no-littering-var-directory .etc)

(when (boundp 'comp-eln-load-path)
  (setcar comp-eln-load-path (exand-file-name (.etc "eln-cache" t))))

;;; Packages

(dolist (pkg '(no-littering
               exec-path-from-shell
               setup))
  (require pkg))

;;; Use shell path

(dolist (var '("SSH_AUTH_SOCK"
               "SSH_AGENT_PID"
               "GPG_AGENT_INFO"
               "LANG"
               "LC_TYPE"
               "NIX_SSL_CERT_FILE"
               "NIX_PATH"))
  (add-to-list 'exec-path-from-shell-variables var))
(exec-path-from-shell-initialize)

(provide 'early-init)
;;; early-init.el ends here
