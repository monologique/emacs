(defvar +treesit-language-specs
  `(("bash"   (bash   . ("https://github.com/tree-sitter/tree-sitter-bash")))
    ("css"    (css    . ("https://github.com/tree-sitter/tree-sitter-css")))
    ("go"     (go     . ("https://github.com/tree-sitter/tree-sitter-go")))
    ("go-mod" (gomod  . ("https://github.com/camdencheek/tree-sitter-go-mod")))
    ("lua"    (lua    . ("https://github.com/tree-sitter-grammars/tree-sitter-lua")))
    ("nix"    (nix    . ("https://github.com/nix-community/tree-sitter-nix")))
    ("ruby"   (ruby   . ("https://github.com/tree-sitter/tree-sitter-ruby")))
    ("rust"   (rust   . ("https://github.com/tree-sitter/tree-sitter-rust" "v0.23.3")))
    ("sql"    (sql    . ("https://github.com/DerekStride/tree-sitter-sql" "gh-pages")))
    ("toml"   (toml   . ("https://github.com/tree-sitter/tree-sitter-toml")))
    ("yaml"   (yaml   . ("https://github.com/tree-sitter-grammars/tree-sitter-yaml")))))

(setq treesit-language-source-alist
      (mapcar (lambda (spec)
                (let ((lang-spec (cdr spec)))
                  (flatten-list lang-spec)))
              +treesit-language-specs))

(defun +treesit-populate-major-mode-remap ()
  "Populate `major-mode-remap-alist' using `+treesit-language-specs'."
  (interactive)
  (when (and (fboundp 'treesit-available-p) (treesit-available-p))
    (dolist (spec +treesit-language-specs)
      (let* ((mode-prefix (car spec))
             (lang-spec (flatten-tree (cdr spec)))
             (lang-symbol (car lang-spec)))
        (when-let (((treesit-ready-p lang-symbol t))
                   (mode (intern (concat mode-prefix "-mode")))
                   (ts-mode (intern (concat mode-prefix "-ts-mode"))))
          (add-to-list 'major-mode-remap-alist (cons mode ts-mode)))))))

(defun +treesit-install-language-grammars ()
  "Install tree-sitter grammars for languages in `+treesit-language-specs'."
  (interactive)
  (dolist (spec +treesit-language-specs)
    (let* ((lang-spec (flatten-tree (cdr spec)))
           (lang-symbol (car lang-spec)))
      (unless (treesit-ready-p lang-symbol t)
        (treesit-install-language-grammar lang-symbol nil))))
  (+treesit-populate-major-mode-remap))

(provide '+treesit)
;;; +treesit ends here
