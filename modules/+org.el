(setup org)

(setup (:package org-modern)
  (add-hook 'org-mode-hook 'org-modern-mode))

(setup (:package olivetti)
  (add-hook 'org-mode-hook 'olivetti-mode))
