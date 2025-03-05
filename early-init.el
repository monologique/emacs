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

(require 'package)

(add-to-list 'package-archives 
             '("melpa" . "https://melpa.org/packages/") t)

(if (not (and (package-installed-p 'no-littering)
              (package-installed-p 'setup)))
    (progn
      (package-refresh-contents)
      (package'install 'no-littering)
      (package-install 'setup))
  (package-initialize))

(dolist (pkg '(no-littering
               setup))
  (if (package-installed-p pkg)
      (require pkg)))

;; Setup macros

(setup-define :package-vc
  (lambda (package)
    (unless (and (package-installed-p (car-safe package))
                 (assoc (car-safe package) (package--alist)))
      (let* ((name (car-safe package))
             (recipe (cdr-safe package))
             (fetcher (plist-get recipe :fetcher))
             (repo (plist-get recipe :repo))
             (branch (plist-get recipe :branch))
             (url (if (plist-member recipe :url)
                      (plist-get recipe :url)
                    (format "https://www.%s.com/%s" fetcher repo)))
             (spec `(,name :url ,url
                           ,@(if branch `(:branch ,branch)))))
        (package-vc-install spec))))
  :documentation "Install a VC package from source.
PACKAGE should be a cons-cell of the form (NAME :fetcher FETCHER :repo REPO [:branch BRANCH])."
  :repeatable t
  :shorthand (lambda (form)
               (if (consp (cadr form)) (caadr form) (cadr form))))

(setup-define :load-after
    (lambda (&rest features)
      (let ((body `(require ',(setup-get 'feature))))
        (dolist (feature (nreverse features))
          (setq body `(with-eval-after-load ',feature ,body)))
        body))
    :documentation "Load the current feature after FEATURES.")

(provide 'early-init)
;;; early-init.el ends here
