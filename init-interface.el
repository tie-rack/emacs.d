(setq inhibit-startup-message t)

(blink-cursor-mode -1)
(menu-bar-mode -1)

(setq visible-bell t)
(setq ring-bell-function
  (lambda () (message "*beep*")))

(setq column-number-mode t)
(transient-mark-mode t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;;; Ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)
(add-hook 'ibuffer-hook
          (lambda ()
            (ibuffer-vc-set-filter-groups-by-vc-root)
            (unless (eq ibuffer-sorting-mode 'alphabetic)
              (ibuffer-do-sort-by-alphabetic))))

(add-hook 'kill-emacs-query-functions
          (lambda () (y-or-n-p "Do you really want to exit Emacs? "))
          'append)

(provide 'init-interface)
