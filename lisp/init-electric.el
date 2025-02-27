(use-package electric
  :demand t
  :ensure nil
  :init
  (setq electric-pair-preserve-balance nil)
  :config
  (electric-pair-mode +1))

(provide 'init-electric)
