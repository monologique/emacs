;;; init.el --- -*- lexical-binding:t -*-
;;; Commentary:
;;; Code:

;; * BENCHMARK AND TUNNING

(let ((emacs-start-time (current-time)))
  (add-hook 'emacs-startup-hook
            (lambda ()
              (let ((elapsed (float-time (time-subtract (current-time) emacs-start-time))))
                (message "[Emacs initialized in %.3fs]" elapsed)))))

(add-hook 'emacs-startup-hook (lambda () (select-frame-set-input-focus (selected-frame))))

;; * CORE

(require '+lib)
(require '+defaults)
(require '+package)

(setq no-littering-etc-directory CACHE-DIRECTORY
      no-littering-var-directory CACHE-DIRECTORY)
(require 'no-littering)

;; * PACKAGES

;; Theming

(setup (:elpaca modus-themes)
  (:require modus-themes +modus-themes)
  (when (boundp 'ns-system-appearance-change-functions)
    (add-hook 'ns-system-appearance-change-functions #'+modus-themes-load-auto)))

(setup (:elpaca fontaine)
  (setq fontaine-latest-state-file
	(expand-file-name "fontaine-latest-state-file.eld" user-emacs-directory)
	fontaine-presets
        '((regular
           :default-family "Iosevka SS15"
           :default-height 160
           :default-weight light

           :mode-line-active-family "sans"
           :mode-line-active-height 0.9

           :mode-line-inactive-family "sans"
           :mode-line-inactive-height 0.9)))

  (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular))
  (add-hook 'enable-theme-functions #'fontaine-mode))

(setup (:elpaca spacious-padding)
  (:hook-into emacs-startup-hook))

(setup (:elpaca olivetti)
  (:face olivetti-fringe ((t (:background nil :foreground nil))))
  (:hook-into org-mode
	      text-mode))


;; ** Modal editing and movement

(setup (:elpaca meow)
  (:require meow +meow)
  (meow-global-mode 1))

;; ** Buffer and window management

(setup (:elpaca activities))
(setup (:elpaca popper))

;; ** Completion, infos and help

(setup (:elpaca corfu)
  (setq tab-always-indent 'complete
	text-mode-ispell-word-completion nil
	read-extended-command-predicate #'command-completion-default-include-p)

  (corfu-popupinfo-mode)
  (global-corfu-mode 1))

(setup (:elpaca cape)
  (:load-after corfu)
  (add-hook 'completion-at-point-functions #'cape-dabbrev))

(setup (:elpaca vertico)
  (:option vertico-count 8)
  (:hook-into emacs-startup-hook))

(setup (:elpaca marginalia)
  (:load-after vertico)
  (:hook-into vertico-mode-hook))

(setup (:elpaca consult))

(setup (:elpaca helpful)
  (:global (kbd "C-h f") #'helpful-callable
	   (kbd "C-h v") #'helpful-variable
	   (kbd "C-h k") #'helpful-key
	   (kbd "C-h x") #'helpful-command))

;; ** Version control
(setup (:elpaca transient))
(setup (:elpaca magit)
  (:load-after transient))

;; * NOTE-TAKING

(setup text-mode
  (:option sentence-end-double-space nil)
  (:hook visual-line-mode))

(setup (:elpaca nix-ts-mode)
  (:file-match "*.nix"))

;; ** Org

;; ** Latex

;; ** QoL
(setup (:elpaca ultra-scroll
	 :host github
	 :repo "jdtsmith/ultra-scroll"
	 :branch "main")
    (:option scroll-conservatively 101
             scroll-margin 0)
    (:hook-into emacs-startup-hook))

(setup (:require org-modern))

(setup (:package citar)
  (:require citar))

(setup (:elpaca markdown-mode))

(defun nix-prefetch-github-to-derivation ()
  "Interactively query GitHub repository and generate Nix derivation."
  (interactive)
  (let* ((author (read-string "GitHub author: "))
         (repo (read-string "Repository name: "))
         (rev (read-string "Revision (optional): " nil nil ""))
         (command (concat "nix-prefetch-github "
                          author " " repo
                          (unless (string-empty-p rev) 
                            (concat " --rev " rev))))
         (json-output (shell-command-to-string command))
         (json-data (json-read-from-string json-output)))
    
    (insert (format "fetchFromGitHub {
    owner = \"%s\";
    repo = \"%s\";
    rev = \"%s\";
    hash = \"%s\";
  };" 
                    (alist-get 'owner json-data)
                    (alist-get 'repo json-data)
                    (alist-get 'rev json-data)
                    (alist-get 'hash json-data)))))
;;; init.el ends here
