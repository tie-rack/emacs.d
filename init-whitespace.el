(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq-default c-basic-offset 2)
(setq-default require-final-newline 't)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'init-whitespace)
