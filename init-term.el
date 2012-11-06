(setq explicit-shell-file-name "/bin/zsh")

(add-hook 'term-mode-hook '(lambda ()
                             (setq mode-line-format
                                   (list
                                    " "
                                    '(:eval (propertize "%b "))
                                    "("
                                    '(:eval (propertize "%m "))
                                    '(:eval (if (term-in-char-mode)
                                                "char) [C-x C-j to switch]"
                                                "line) [C-c C-k to switch]"))))))

(provide 'init-term)
