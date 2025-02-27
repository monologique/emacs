(use-package org
  :ensure nil
  :config
  (add-hook 'org-mode-hook (lambda () (variable-pitch-mode +1))))

(provide 'init-org)
