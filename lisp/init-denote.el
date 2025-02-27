(use-package denote
  :demand t
  :init
  (setq denote-directory (expand-file-name "~/Documents/Notes"))
  (setq denote-known-keywords '("emacs" "networking"))
  :config
  (add-hook 'dired-mode-hook #'denote-dired-mode))

(provide 'init-denote)
