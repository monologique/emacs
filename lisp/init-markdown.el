;;; init-markdown.el --- Summary -*- lexical-binding:t -*-

;;; Commentary:

;;; Code:

(use-package markdown-mode
  :defer t
  :mode ("README\\.md\\'" . gfm-mode))

(provide 'init-markdown)

;;; init-markdown.el ends here
