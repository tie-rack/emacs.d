(package-initialize)

(require 'org)
(require 'ob-tangle)

(org-babel-load-file (expand-file-name "~/.emacs.d/tierack.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (dim lua-mode spotify yaml-mode typed-clojure-mode tide swiper sqlup-mode rainbow-delimiters quelpa nyan-mode nodejs-repl markdown-mode magit less-css-mode ibuffer-vc go-mode find-file-in-project emacs-pager dockerfile-mode company color-theme clojurescript-mode clj-refactor cargo browse-kill-ring))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
