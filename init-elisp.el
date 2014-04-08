(require 'paredit)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)

(require 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

(provide 'init-elisp)
