;; disable not-so-useful modes
(setq inhibit-startup-message t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; add custom-code to custom-file
(setq custom-file "~/.emacs.d/custom-file.el")
(load-file custom-file)

;; package initialization and other stuff
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa". "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable". "https://stable.melpa.org/packages/") t)
(add-to-list 'load-path "~/.emacs.d/libs")

(when (not (package-installed-p 'use-package))
  (package-refresh-contents)
  (package-install 'use-package))

;; Enable useful builtin modes
(global-display-line-numbers-mode)
(display-time-mode)

;; Favorite Font
(set-frame-font "Iosevka Term-12" nil t)

;; Package List
;; use-package, gruvbox-theme, evil, magit, company, flycheck, smartparens, evil-leader
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "SPC")
(evil-leader/set-key
  "v" 'evil-window-vsplit
  "s" 'evil-window-split
  "w h" 'evil-window-left
  "w l" 'evil-window-right
  "w k" 'evil-window-top
  "w j" 'evil-window-bottom
  "d n" 'dired
  "c c" 'compile
  "c r" 'recompile
  "g g" 'magit-status)

(use-package gruvbox-theme
  :ensure t
  :config (load-theme 'gruvbox))

(use-package magit
  :ensure t)

(use-package evil
  :ensure t
  :config (evil-mode t))

(define-key evil-normal-state-map (kbd "v") 'evil-window-vsplit)

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package flycheck
  :ensure t)

(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode t))
