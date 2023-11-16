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

;;; My global keybindings

(setq cms/keybindings nil)

(defun cms/add-keybinding (keys command)
  "Given `keys` (will be passed to `kbd`) and a command, globally
set that binding. This will also put it in `cms/keybindings`,
which gets used to generate the `initial-scratch-message`."
  (add-to-list 'cms/keybindings (list keys command))
  (global-set-key (kbd keys) command))

;;; Packages

(require 'package)
(require 'use-package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)

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
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-tooltip-align-annotations t)
  :delight)

;; Nyan

(use-package nyan-mode
  :config
  (setq nyan-wavy-trail nil)
  (setq nyan-bar-length 12)
  (setq nyan-cat-face-number 4)
  (nyan-mode))

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
  :config
  (setq rust-format-on-save t)
  (add-to-list 'exec-path (expand-file-name "~/.cargo/bin"))
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
  :config
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
  :config
  (setq lsp-rust-analyzer-server-command '("rust-analyzer")))

;; Docker

(use-package dockerfile-mode)

;; Markdown

(use-package markdown-mode
  :config
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
  (setq magit-last-seen-setup-instructions "1.4.0"))

(cms/add-keybinding "C-c m s" #'magit-status)

;; Terraform

(use-package terraform-mode
  :pin melpa-stable)

;;; Shell

(defun cms/rename-shell-buffer ()
  (interactive)
  (let ((directory-basename (file-name-base
                             (directory-file-name
                              default-directory))))
    (rename-buffer (concat "*" directory-basename "-shell*") t)))

(add-hook 'shell-mode-hook #'cms/rename-shell-buffer)

(cms/add-keybinding "C-c s r" #'cms/rename-shell-buffer)

;;; Extra keybindings

(cms/add-keybinding "C-c b p" #'browse-url-at-point)
(cms/add-keybinding "C-c b b" #'browse-url-of-buffer)
(cms/add-keybinding "C-c f f" #'find-file-at-point)

;;; Local configs

(if (file-exists-p "~/.emacslocal.el")
    (load "~/.emacslocal.el"))

;;; initial-scratch-message

(defun cms/build-initial-scratch-message ()
  (concat
   (apply #'concat
          (seq-map (lambda (binding)
                     (format ";; %s [%s]\n"
                             (car binding)
                             (cadr binding)))
                   (seq-sort-by #'car #'string< cms/keybindings)))
   "\n"))

(setq initial-scratch-message
      (cms/build-initial-scratch-message))

;;; Server

(server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
