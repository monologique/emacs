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

(setq package-enable-at-startup nil
      package-quickstart nil)

 (defvar elpaca-core-date (list (string-to-number (format-time-string "%Y%m%d"))))

 (defvar elpaca-installer-version 0.10)
 (defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
 (defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
 (defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
 (defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
			       :ref nil :depth 1 :inherit ignore
			       :files (:defaults "elpaca-test.el" (:exclude "extensions"))
			       :build (:not elpaca--activate-package)))
 (let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
	(build (expand-file-name "elpaca/" elpaca-builds-directory))
	(order (cdr elpaca-order))
	(default-directory repo))
   (add-to-list 'load-path (if (file-exists-p build) build repo))
   (unless (file-exists-p repo)
     (make-directory repo t)
     (when (<= emacs-major-version 28) (require 'subr-x))
     (condition-case-unless-debug err
	 (if-let* ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
		   ((zerop (apply #'call-process `("git" nil ,buffer t "clone"
						   ,@(when-let* ((depth (plist-get order :depth)))
						       (list (format "--depth=%d" depth) "--no-single-branch"))
						   ,(plist-get order :repo) ,repo))))
		   ((zerop (call-process "git" nil buffer t "checkout"
					 (or (plist-get order :ref) "--"))))
		   (emacs (concat invocation-directory invocation-name))
		   ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
					 "--eval" "(byte-recompile-directory \".\" 0 'force)")))
		   ((require 'elpaca))
		   ((elpaca-generate-autoloads "elpaca" repo)))
	     (progn (message "%s" (buffer-string)) (kill-buffer buffer))
	   (error "%s" (with-current-buffer buffer (buffer-string))))
       ((error) (warn "%s" err) (delete-directory repo 'recursive))))
   (unless (require 'elpaca-autoloads nil t)
     (require 'elpaca)
     (elpaca-generate-autoloads "elpaca" repo)
     (load "./elpaca-autoloads")))
 (add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

(elpaca setup (require 'setup))
(elpaca no-littering (require 'no-littering))
(elpaca-wait)

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

(setup-define :load-after
    (lambda (&rest features)
      (let ((body `(require ',(setup-get 'feature))))
        (dolist (feature (nreverse features))
          (setq body `(with-eval-after-load ',feature ,body)))
        body))
    :documentation "Load the current feature after FEATURES.")

;;; Defaults


(provide 'early-init)
;;; early-init.el ends here
