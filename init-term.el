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

(defun zsh (buffer-name)
  "Start a zsh ansi-shell and name it."
  (interactive "sname: ")
  (term "/bin/zsh")
  (rename-buffer buffer-name t))

(provide 'init-term)
