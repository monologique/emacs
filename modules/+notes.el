(setup (:elpaca denote)
  (require 'denote)
  (setq denote-directory (mono-xdg-docs-home "Notes" t))

  (with-eval-after-load 'denote
    (add-hook 'dired-mode-hook 'denote-dired-mode)))
