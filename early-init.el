;;; early-init.el -*- lexical-binding:t -*-

;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum)

(setq package-enable-at-startup nil
      package-quickstart nil
      load-prefer-newer t)

(unless (or (daemonp) noninteractive)
  (let ((old-file-name-handler-alist file-name-handler-alist))
    ;; `file-name-handler-alist' is consulted on each `require', `load' and
    ;; various path/io functions. You get a minor speed up by unsetting this.
    ;; Some warning, however: this could cause problems on builds of Emacs where
    ;; its site lisp files aren't byte-compiled and we're forced to load the
    ;; *.el.gz files (e.g. on Alpine).
    (setq-default file-name-handler-alist nil)
    ;; ...but restore `file-name-handler-alist' later, because it is needed for
    ;; handling encrypted or compressed files, among other things.
    (defun my/reset-file-handler-alist ()
      (setq file-name-handler-alist
            ;; Merge instead of overwrite because there may have been changes to
            ;; `file-name-handler-alist' since startup we want to preserve.
            (delete-dups (append file-name-handler-alist
                                 old-file-name-handler-alist))))
    (add-hook 'emacs-startup-hook #'my/reset-file-handler-alist 101)))

;; * NATIVE COMPILATION

(when (boundp 'native-comp-eln-load-path)
    (add-to-list 'native-comp-eln-load-path
		 (expand-file-name "eln-cache" (expand-file-name ".etc" user-emacs-directory)))
    (setq native-comp-async-report-warnings-errors 'silent
          native-comp-deferred-compilation t))

;; * FRAME SETTINGS

(setq indicate-empty-lines nil
      frame-inhibit-implied-resize t
      frame-resize-pixelwise t
      frame-title-format nil
      window-resize-pixelwise t)
(add-to-list 'default-frame-alist '(undecorated-round . t))

;; * LSP
(when (package-installed-p 'lsp-mode)
  (setenv "LSP_USE_PLISTS" "true"))

(add-to-list 'load-path (expand-file-name "lisp/" user-emacs-directory))
