(require 'git-gutter)

;; git-gutter toggle command
(global-set-key (kbd "C-c C-g t") 'git-gutter:toggle)

;; Update changes information after save buffer
(add-hook 'after-save-hook
          (lambda ()
            (when (zerop (call-process-shell-command "git rev-parse --show-toplevel"))
              (git-gutter))))

(provide 'init-git-gutter)
