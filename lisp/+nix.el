(defun +nix-prefetch-github ()
  "Interactively query GitHub repository and generate Nix derivation."
  (interactive)
  (let* ((author (read-string "GitHub author: "))
         (repo (read-string "Repository name: "))
         (rev (read-string "Revision (optional): " nil nil ""))
         (command (concat "nix-prefetch-github "
                          author " " repo
                          (unless (string-empty-p rev) 
                            (concat " --rev " rev))))
         (json-output (shell-command-to-string command))
         (json-data (json-read-from-string json-output)))
    
    (insert (format "fetchFromGitHub {
    owner = \"%s\";
    repo = \"%s\";
    rev = \"%s\";
    hash = \"%s\";
  };" 
                    (alist-get 'owner json-data)
                    (alist-get 'repo json-data)
                    (alist-get 'rev json-data)
                    (alist-get 'hash json-data)))))

(provide '+nix)
;;;+nix.el ends here
