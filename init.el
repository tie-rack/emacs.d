;;; About me

(setq user-full-name "Chris Shea"
      user-mail-address "cmshea@gmail.com")

;;; Directories

;; Home
(setq default-directory "~")

;; Path
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "/usr/local/sbin")

;; Autosaves
(defvar autosave-dir "~/.emacs.d/auto-saves/")
(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
    (if buffer-file-name
        (concat "#" (file-name-nondirectory buffer-file-name) "#")
      (expand-file-name
        (concat "#%" (buffer-name) "#")))))

;; Backups

(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;;; Packages

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)

;;; Interface

(setq inhibit-startup-message t)
(blink-cursor-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)
(setq visible-bell t)
(setq ring-bell-function
  (lambda () (message "*beep*")))
(setq column-number-mode t)

;; delight

(use-package delight
  :config (delight '((eldoc-mode nil "eldoc"))))

;; Filenames

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; ido

(require 'ido)
(ido-mode t)

;; ivy

(use-package ivy
  :config (ivy-mode)
  :delight)

;; company

(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-tooltip-align-annotations t)
  :delight)

;; Nyan

(use-package nyan-mode
  :init
  (setq nyan-wavy-trail nil)
  (setq nyan-bar-length 12)
  (setq nyan-cat-face-number 4)
  (nyan-mode))

;;; Emoji

;; (use-package emojify
;;   :pin melpa-stable
;;   :hook (after-init . global-emojify-mode))

;;; Code

(setq-default require-final-newline 't)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq-default indent-tabs-mode nil)

(setq-default tab-width 2)
(setq-default c-basic-offset 2)
(setq-default js-indent-level 2)
(setq-default css-indent-offset 2)

;; JavaScript/TypeScript

(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . javascript-mode))

;; Lisp

(use-package paredit
  :hook
  ((emacs-lisp-mode) . paredit-mode)
  :bind (:map paredit-mode-map
         ("C-c )" . paredit-forward-slurp-sexp)
         ("C-c }" . paredit-forward-barf-sexp)
         ("C-c (" . paredit-backward-slurp-sexp)
         ("C-c {" . paredit-backward-barf-sexp)
         ("C-c w" . paredit-copy-as-kill))
  :delight " ()")

(use-package rainbow-delimiters
  :hook
  ((emacs-lisp-mode) . rainbow-delimiters-mode))

(use-package clojure-mode
  :pin melpa-stable)

;; Rust

(use-package rust-mode
  :init
  (setq rust-format-on-save t)
  :pin melpa-stable
  :hook
  (rust-mode . yas-minor-mode)
  :bind (:map rust-mode-map
              ([tab] . company-indent-or-complete-common)))

(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

(use-package toml-mode)

;; Python

(use-package elpy
  :ensure t
  :defer t
  :pin melpa-stable
  :init
  (advice-add 'python-mode :before 'elpy-enable))

;; Go

(use-package go-mode
  :defer t
  :ensure t
  :pin melpa-stable
  :hook
  (go-mode . lsp-deferred)
  (go-mode . yas-minor-mode))

;; LSP

(use-package lsp-mode
  :pin melpa-stable
  :hook
  (rust-mode . lsp-deferred)
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-rust-analyzer-server-command '("rust-analyzer")))

;; Docker

(use-package dockerfile-mode)

;; Markdown

(use-package markdown-mode
  :init
  (setq markdown-content-type "text/html")
  (setq markdown-coding-system 'utf-8)
  (add-hook 'markdown-mode-hook 'auto-fill-mode)
  :config
  (add-to-list 'markdown-css-paths
               (expand-file-name "~/.emacs.d/markdown.css")))

;; Yaml

(use-package yaml-mode
  :pin melpa-stable)

;; Magit

(use-package magit
  :config
  (setq magit-last-seen-setup-instructions "1.4.0")
  :bind (("C-c m s" . magit-status)))

;; Terraform

(use-package terraform-mode
  :pin melpa-stable)

;;; Local configs

(if (file-exists-p "~/.emacslocal.el")
  (load "~/.emacslocal.el"))

;;; Server

(server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(rust-mode yaml-mode clojure-mode lsp-mode go-mode emojify elpy emacs use-package toml-mode rainbow-delimiters paredit nyan-mode magit ivy dockerfile-mode delight company cargo)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
