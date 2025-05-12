(setup (:package denote)
  (require 'denote)
  (setq denote-directory (mono-xdg-docs-home "Notes"))

  (with-eval-after-load 'denote
    (add-hook 'dired-mode-hook 'denote-dired-mode)))
