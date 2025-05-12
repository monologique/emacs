(setup org)

(setup (:elpaca org-modern)
  (add-hook 'org-mode-hook 'org-modern-mode))

(setup (:elpaca olivetti)
  (add-hook 'org-mode-hook 'olivetti-mode))
