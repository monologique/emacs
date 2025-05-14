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

;; * PACKAGES


;; Theming
(setup (:elpaca modus-themes)
  (:require modus-themes +modus-themes)
  
  (+modus-themes-apply-customization)
  (modus-themes-load-theme 'modus-operandi))

;; ** Modal editing and movement

(setup (:elpaca meow)
  (:require meow +meow)
  (meow-global-mode 1))

;; ** Font face

(setup (:elpaca fontaine)
  (setq fontaine-latest-state-file
	(expand-file-name "fontaine-latest-state-file.eld" user-emacs-directory))
  (setq fontaine-presets
        '((regular
           :default-family "Iosevka SS15"
           :default-height 160
           :default-weight regular

           :mode-line-active-family "sans"
           :mode-line-active-height 0.9

           :mode-line-inactive-family "sans"
           :mode-line-inactive-height 0.9)))
  
  (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular))
  (add-hook 'enable-theme-functions #'fontaine-mode))

;; ** Buffer and window management

(setup (:elpaca activities))
(setup (:elpaca popper))

;; ** Completion

(setup (:elpaca corfu)
  (setq tab-always-indent 'complete
	text-mode-ispell-word-completion nil
	read-extended-command-predicate #'command-completion-default-include-p)

  (corfu-popupinfo-mode)
  (global-corfu-mode 1))

(setup (:elpaca cape)
  (:load-after corfu)
  (add-hook 'completion-at-point-functions #'cape-dabbrev))

;; ** Version control
(setup (:elpaca transient))
(setup (:elpaca magit)
  (:load-after transient))

;; ** Note-taking

(setup (:elpaca olivetti)
  (:hook-into org-mode
	      text-mode))

;; ** Org


;; ** QoL


;;; init.el ends here
