;;; init-uniquify.el --- Summary -*- lexical-binding:t -*-

;;; Code:

;;; Commentary:

(use-package uniquify
  :ensure nil
  :init
  (setq uniquify-buffer-name-style 'reverse
	uniquify-separator" • "
	uniquify-after-kill-buffer-p t
	uniquify-ignore-buffers-re "^\\*"))

(provide 'init-uniquify)
;;; init-uniquify.el ends here
