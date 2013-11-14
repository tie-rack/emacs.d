(add-to-list 'load-path "~/.emacs.d/vendor/nyan-mode")
(require 'nyan-mode)
(setq nyan-wavy-trail t)
(setq nyan-bar-length 20)
(setq nyan-animate-nyancat nil)
(nyan-mode)

(provide 'init-nyan)
