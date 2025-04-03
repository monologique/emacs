;;; +emacs.el --- Summary -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

(require 'early-init (locate-user-emacs-file "early-init.el"))
;;(require 'no-littering)

(setq-default
 apropos-do-all t
 async-shell-command-buffer 'new-buffer
 async-shell-command-display-buffer nil
 ;; auto-hscroll-mode 'current-line
 auto-revert-verbose t
 auto-save-default nil
 auto-save-file-name-transforms `((".*" ,(.etc "auto-save/") ,(car (secure-hash-algorithms)))
                                  (".*" ,(.etc "auto-save/") t))
 auto-save-interval 30
 auto-save-list-file-prefix (.etc "auto-save/.saves-" t)
 auto-save-timeout 30
 auto-save-visited-interval 5
 auto-window-vscroll nil
 backup-by-copying t
 backup-directory-alist `((".*" . ,(.etc "backup/" t)))
 blink-cursor-blinks 0
 confirm-nonexistent-file-or-buffer nil
 comp-deferred-compilation nil
 create-lockfiles nil
 cursor-in-non-selected-windows 'hollow
 custom-file (.etc "custom.el")
 delete-old-versions t
 desktop-path (list .etc)
 desktop-auto-save-timeout 600
 echo-keystrokes 0.1
 ediff-window-setup-function 'ediff-setup-windows-plain
 eldoc-echo-area-use-multiline-p nil
 eldoc-idle-delay 0.1
 enable-recursive-minibuffers t
 executable-prefix-env t
 ;; Makes the shadowed text invisible and prevents the cursor from moving into
 ;; the shadowed text.
 file-name-shadow-properties '(invisible t intangible t)
 find-file-visit-truename t
 frame-resize-pixelwise t
 global-auto-revert-non-file-buffers t
 global-mark-ring-max 100
 hscroll-margin 5
 hscroll-step 0
 imenu-auto-rescan t
 image-use-external-converter (or (executable-find "ffmpeg")
				  (executable-find "convert"))
 indent-tabs-mode nil
 inhibit-startup-screen t
 ;; inhibit-startup-message t
 ;; inhibit-startup-echo-area-message t
 initial-scratch-message nil
 initial-buffer-choice t
 kept-new-versions 6
 kept-old-versions 2
 kmacro-ring-max 50
 load-prefer-newer noninteractive
 mark-ring-max 50
 max-lisp-eval-depth 10000
 minibuffer-prompt-properties (list 'read-only t
                                    'cursor-intangible t
                                    'face 'minibuffer-prompt)
 mode-require-final-newline 'visit-save
 mouse-drag-copy-region t
 mouse-wheel-progressive-speed nil
 mouse-yank-at-point t
 native-comp-async-report-warnings-errors 'silent
 ;;native-comp-deferred-compilation nil
 project-vc-ignores '("elpa")
 read-answer-short t
 read-buffer-completion-ignore-case t
 ;; TODO: set a helper for bytes read-process-output-max
 recenter-positions '(top middle bottom)
 ring-bell-function #'ignore
 regexp-search-ring-max 200
 save-interprogram-paste-before-kill t
 ;; TODO : save-some-buffers-default-predicate
 search-ring-max 200
 sentence-end-double-space t
 set-mark-command-repeat-pop t
 show-paren-delay 0
 show-paren-style 'parenthesis
 show-paren-when-point-in-periphery t
 show-paren-when-point-inside-paren t
 ;; TODO: change symbol for whitespace show-trailing-whitespace t
 ;; tramp
 undo-limit 100000
 use-dialog-box nil
 use-file-dialog nil
 use-short-answers t
 vc-follow-symlinks t
 vc-make-backup-files t
 version-control t
 window-resize-pixelwise t
 yank-pop-change-selection t)

;;; Encoding

(set-language-environment 'utf-8)
(prefer-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)

;;; Modes

(dolist (enable-mode '(global-auto-revert-mode
                       blink-cursor-mode
                       electric-pair-mode
                       show-paren-mode
                       global-so-long-mode
                       minibuffer-depth-indicate-mode
                       file-name-shadow-mode
                       minibuffer-electric-default-mode
                       delete-selection-mode))
  (when (fboundp enable-mode)
    (funcall enable-mode +1)))

;;; Hooks

(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

(defun +auto-create-missing-dirs ()
  "Automatically create missing directories when finding a file."
  ;; https://git.acdw.net/emacs/tree/lisp/+emacs.el?id=3e78d1f8ca5b100f39577790614433398bc6a422#n216
  (let ((target-dir (file-name-directory buffer-file-name)))
    (unless (file-exists-p target-dir)
      (make-directory target-dir t))))

(add-hook 'find-file-not-found-functions #'+auto-create-missing-dirs)

;;; Advices

;; Indent the region after a yank.
(defun +yank@indent (&rest _)
  "Indent the current region."
  (indent-region (min (point) (mark)) (max (point) (mark))))
(advice-add #'yank :after #'+yank@indent)
(advice-add #'yank-pop :after #'+yank@indent)

;; Some libraries
(when (require 'uniquify nil :noerror)
  (setq-default uniquify-buffer-name-style 'reverse
                uniquify-separator " • "
                uniquify-after-kill-buffer-p t
                uniquify-ignore-buffers-re "^\\*"))

(when (require 'goto-address nil :noerror)
  (if (fboundp 'global-goto-address-mode)
      (global-goto-address-mode +1)))

(when (require 'recentf nil :noerror)
  (setq-default recentf-save-file (.etc "recentf.el")
                recentf-max-menu-items 100
                recentf-max-saved-items nil
                recentf-auto-cleanup 'mode)
  (add-to-list 'recentf-exclude .etc)
  (recentf-mode +1))

(when (require 'savehist nil :noerror)
  (setq-default history-length t
                history-delete-duplicates t
                history-autosave-interval 60
                savehist-file (.etc "savehist.el")
                ;; Other variables --- don't truncate any of these.
                ;; `add-to-history' uses the values of these variables unless
                ;; they're nil, in which case it falls back to `history-length'.
                kill-ring-max 100
                mark-ring-max 100
                global-mark-ring-max 100
                regexp-search-ring-max 100
                search-ring-max 100
                kmacro-ring-max 100
                eww-history-limit 100)
  (dolist (var '(extended-command-history
                 global-mark-ring
                 mark-ring
                 kill-ring
                 kmacro-ring
                 regexp-search-ring
                 search-ring))
    (add-to-list 'savehist-additional-variables var))
  (savehist-mode +1))

(when (require 'saveplace nil :noerror)
  (setq-default save-place-file (.etc "places.el")
                save-place-forget-unreadable-files (eq system-type '(gnu/linux darwin)))
  (save-place-mode +1))

(when (fboundp 'repeat-mode)
  (setq-default repeat-exit-key "g"
                repeat-exit-timeout 5)
  (repeat-mode +1))

(when (require 'desktop nil :noerror)
  (setq-default desktop-path (list .etc)
                desktop-auto-save-timeout 600)
  (add-hook 'window-setup-hook #'desktop-save-mode))

(when (require 'autorevert nil :noerror)
  (setq-default global-auto-revert-non-file-buffers t
                auto-revert-verbose nil)
  (global-auto-revert-mode +1))

(provide '+emacs)
;;; +emacs.el ends here
