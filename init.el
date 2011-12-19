;; Keep backups from cluttering up working directories
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

(setq path "/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin")
(setenv "PATH" path)
(setq exec-path (append '("/usr/local/bin" "/usr/local/sbin") exec-path))

;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
;; (taken from: http://snarfed.org/space/gnu%20emacs%20backup%20files)
(defvar autosave-dir
 (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))

(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
   (if buffer-file-name
      (concat "#" (file-name-nondirectory buffer-file-name) "#")
    (expand-file-name
     (concat "#%" (buffer-name) "#")))))

;; No scrollbar, no toolbar, no blinking cursor, no beep, no menu
(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(setq visible-bell t)
(menu-bar-mode -1)

;; No flashing!
(setq ring-bell-function
  (lambda () (message "*beep*")))

;; Column numbers!
(setq column-number-mode t)

;; No startup message
(setq inhibit-startup-message t)

;; Highlight with mark
(transient-mark-mode t)

;; Color
(set-background-color "black")
(set-foreground-color "white")

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Spaces
(setq-default indent-tabs-mode nil)
(setq-default require-final-newline 't)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Platform-specific configurations
(cond ((string-match "apple" (emacs-version))
       (set-default-font "-apple-inconsolata-medium-r-normal--15-150-72-72-m-150-iso10646-1")
       (setq initial-frame-alist '((top . 1) (width . 120) (height . 45)))))

;; ido - Better buffer/file interaction
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; Key bindings
(global-set-key [S-backspace] 'backward-delete-char)
(global-set-key "\C-c\C-y" 'clipboard-yank)
(defun switch-to-scratch nil
  (interactive)
  (switch-to-buffer "*scratch*"))
(global-set-key "\C-cb" 'switch-to-scratch)
(global-set-key "\M-`" 'other-window)
; I'd rather this than seeing "C-x C-g is undefined" all the time
(global-set-key "\C-x\C-g" 'keyboard-quit)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)

;; Ask for confirmation before quitting Emacs
(add-hook 'kill-emacs-query-functions
          (lambda () (y-or-n-p "Do you really want to exit Emacs? "))
          'append)

;; Packages
;; require-package and set up lovingly copied from github.com/purcell/emacs.d
(defun require-package (package)
  "Ask elpa to install given PACKAGE."
  (unless (package-installed-p package)
    (package-install package)))

(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require-package 'clojure-mode)
(require-package 'clojurescript-mode)
(require-package 'closure-lint-mode)
(require-package 'haml-mode)
(require-package 'js2-mode)
(require-package 'markdown-mode)
(require-package 'paredit)
(require-package 'scala-mode)
(require-package 'slime)
(require-package 'yaml-mode)

;; Clojure
(require 'paredit)
(add-hook 'clojure-mode-hook 'enable-paredit-mode)

;; Nyan
(add-to-list 'load-path "~/.emacs.d/vendor/nyan-mode")
(require 'nyan-mode)
(setq nyan-wavy-tail t)
(setq nyan-bar-length 20)
(setq nyan-animate-nyancat t)
(nyan-mode)

;; local settings
(if (file-exists-p "~/.emacslocal")
    (load "~/.emacslocal"))
