(add-to-list 'load-path "~/.emacs.d/vendor/nyan-mode")
(require 'nyan-mode)
(setq nyan-wavy-tail t)
(setq nyan-bar-length 20)
(setq nyan-animate-nyancat t)
(nyan-mode)

(provide 'init-nyan)
