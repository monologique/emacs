;;; +machines.el --- Per-system configuration -*- lexical-binding:t -*-

;;; Commentary:
;;; Sets per-system defaults values.

;;; Code:

(defconst *machine-name (system-name) "Macro to return the hostname.")

(+define-dir .machines (locate-user-emacs-file "machines")
  "Directory for all host custom configuration files.")
(add-to-list 'load-path .machines)

(defmacro *machine-if (true-branch &optional false-branch)
  "Execute TRUE-BRANCH if machine-specific config exists, else FALSE-BRANCH.
Checks for the existence of a file in `.machines' named after (system-name).el"
  (let ((machine-file
         (expand-file-name
          (format "%s.el" *machine-name) .machines)))
    `(if (file-exists-p ,machine-file)
         ,true-branch
       ,false-branch)))

(*machine-if (require (intern *machine-name) nil t))

(provide '+machines)
