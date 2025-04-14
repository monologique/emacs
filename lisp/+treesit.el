(defvar +treesit-language-specs
  '((bash "bash" "https://github.com/tree-sitter/tree-sitter.bash")
    (css  "css"  "https://github.com/tree-sitter/tree-sitter.css")
    (go   "go"   "https://github.com/tree-sitter/tree-sitter.go")
    (lua  "lua"  "https://github.com/tree-sitter-grammars/tree-sitter-lua")
    (ruby "ruby" "https://github.com/tree-sitter/tree-sitter-ruby")
    (sql  "sql"  "https://github.com/DerekStride/tree-sitter-sql")
    (toml "toml" "https://github.com/tree-sitter/tree-sitter-toml")))

(setq treesit-language-source-alist
      (mapcar (lambda (spec) (list (nth 0 spec) (nth 2 spec)))
              +treesit-language-specs))

(defun +treesit-populate-major-mode-remap ()
  "Populate `major-mode-remap-alist' using `+treesit-language-specs'."
  (interactive)
  (when (and (fboundp #'treesit-available-p) (treesit-available-p))
    (dolist (spec +treesit-language-specs)
      (let ((lang-symbol (nth 0 spec)))
        (when-let (((treesit-ready-p lang-symbol t))
                   (mode-prefix (nth 1 spec))
                   (mode (intern (concat mode-prefix "-mode")))
                   (ts-mode (intern (concat mode-prefix "-ts-mode"))))
          (add-to-list 'major-mode-remap-alist (cons mode ts-mode)))))))

(defvar +treesit-language-specs
  '((bash "bash" "https://github.com/tree-sitter/tree-sitter.bash")
    (css  "css"  "https://github.com/tree-sitter/tree-sitter.css")
    (go   "go"   "https://github.com/tree-sitter/tree-sitter.go")
    (lua  "lua"  "https://github.com/tree-sitter-grammars/tree-sitter-lua")
    (ruby "ruby" "https://github.com/tree-sitter/tree-sitter-ruby")
    (sql  "sql"  "https://github.com/DerekStride/tree-sitter-sql")
    (toml "toml" "https://github.com/tree-sitter/tree-sitter-toml")))

(setq treesit-language-source-alist
      (mapcar (lambda (spec) (list (nth 0 spec) (nth 2 spec)))
              +treesit-language-specs))

(defun +treesit-populate-major-mode-remap ()
  "Populate `major-mode-remap-alist' using `+treesit-language-specs'."
  (interactive)
  (when (and (fboundp #'treesit-available-p) (treesit-available-p))
    (dolist (spec +treesit-language-specs)
      (let ((lang-symbol (nth 0 spec)))
        (when-let (((treesit-ready-p lang-symbol t))
                   (mode-prefix (nth 1 spec))
                   (mode (intern (concat mode-prefix "-mode")))
                   (ts-mode (intern (concat mode-prefix "-ts-mode"))))
          (add-to-list 'major-mode-remap-alist (cons mode ts-mode)))))))

(defun +treesit-install-language-grammars ()
  "Install tree-sitter grammars for languages in `+treesit-language-specs'."
  (interactive)
  (dolist (spec +treesit-language-specs)
    (let ((lang-symbol (nth 0 spec)))
          (unless (treesit-ready-p lang-symbol t)
            (treesit-install-language-grammar lang-symbol 'interactive)))
    (+treesit-populate-major-mode-remap)))

(provide '+treesit)
;;; +treesit ends here
