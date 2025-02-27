;;; init-treesitter.el --- Summary -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:

(use-package tree-sitter-langs
  :config
  (defun my/copy-grammars-to-emacs-tree-sitter-dir ()
    "Copy tree-sitter grammar files to native Emacs dir."
    (interactive)
    (let* ((files (directory-files (tree-sitter-langs--bin-dir) nil "\\.dylib$")))
      (dolist (grammar-file files)
	(copy-file (concat (tree-sitter-langs--bin-dir) grammar-file) (concat (expand-file-name user-emacs-directory) "tree-sitter/" "libtree-sitter-" grammar-file) t)
	(message "%s grammar files copied" (length files))))))

(provide 'init-treesitter)
;;; init-treesitter.el ends here

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
