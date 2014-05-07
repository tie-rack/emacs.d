;; Settings that only make sense for graphical emacs

(set-background-color "black")
(set-foreground-color "white")

(scroll-bar-mode -1)
(tool-bar-mode -1)

(cond ((string-match "NS apple-appkit" (emacs-version))
       (set-default-font "-apple-inconsolata-medium-r-normal--16-160-72-72-m-160-iso10646-1")))

(setq initial-frame-alist '((top . 1) (width . 120) (height . 45)))

(require 'init-nyan)

(provide 'init-graphic)
