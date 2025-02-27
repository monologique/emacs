(use-package emacs
  :ensure nil
  :init
  ;; Silence bell
  (setq ring-bell-function 'ignore)
  
  ;; No startup screen
  (setq inhibit-startup-screen t)

  ;; No startup message
  (setq inhibit-startup-message t)
  (setq inhibit-startup-echo-area-message t)

  ;; No message in scratch buffer
  (setq initial-scratch-message nil)

  ;; Initial buffer
  (setq initial-buffer-choice nil)

  ;; No confirmation for visiting non-existent files
  (setq confirm-nonexistent-file-or-buffer nil)

  (setq auto-fill-mode nil)
  (setq fill-column 80)

  ;; Minimal UI
  (tool-bar-mode -1)
  (scroll-bar-mode -1)

  ;; y or n for yes or no questions
  (fset 'yes-or-no-p 'y-or-n-p)

  ;; Buffer encoding
  (prefer-coding-system 'utf-8)
  (set-default-coding-systems 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-language-environment 'utf-8 )


  (when (eq system-type 'darwin)
    (setq ns-use-native-fullscreen t
	  mac-option-key-is-meta nil
	  mac-command-key-is-meta t
	  mac-command-modifier 'meta
	  mac-option-modifier nil))
  )

(provide 'init-defaults)
