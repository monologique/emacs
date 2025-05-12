;;; mono-path.el --- Core file -*- lexical-binding: t -*-
;;
;; Copyright (c) 2025-2025 Paul-Mathias Logue

;;; Code:

(defvar mono-core-directory
  (expand-file-name "app" user-emacs-directory)
  "monologique core directory")

(+define-directory mono-etc-directory (locate-user-emacs-file ".etc")
  "Directory for all of Emacs' various files.")

(+define-directory mono-modules-directory (locate-user-emacs-file "modules")
  "Directory for all of custom packages formulas.")

(+define-directory mono-xdg-docs-home (expand-file-name "Documents/" (getenv "HOME"))
  "Directory for all of custom packages formulas.")

(provide 'mono-path)
;;; mono-path.el ends here
