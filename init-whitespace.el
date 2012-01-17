(setq-default indent-tabs-mode nil)
(setq-default require-final-newline 't)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'init-whitespace)
