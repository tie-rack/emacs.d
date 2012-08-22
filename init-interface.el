(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode -1)
(menu-bar-mode -1)

(setq visible-bell t)
(setq ring-bell-function
  (lambda () (message "*beep*")))

(setq column-number-mode t)
(transient-mark-mode t)

(set-background-color "black")
(set-foreground-color "white")

(cond ((string-match "apple" (emacs-version))
       (set-default-font "-apple-inconsolata-medium-r-normal--18-180-72-72-m-180-iso10646-1")
       (setq initial-frame-alist '((top . 1) (width . 120) (height . 45)))))

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

(add-hook 'kill-emacs-query-functions
          (lambda () (y-or-n-p "Do you really want to exit Emacs? "))
          'append)

(provide 'init-interface)
