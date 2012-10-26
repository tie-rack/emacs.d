(global-set-key [S-backspace] 'backward-delete-char)
(global-set-key "\C-c\C-y" 'clipboard-yank)
(defun switch-to-scratch nil
  (interactive)
  (switch-to-buffer "*scratch*"))
(global-set-key "\C-cb" 'switch-to-scratch)
(global-set-key "\M-`" 'other-window)
; I'd rather this than seeing "C-x C-g is undefined" all the time
(global-set-key "\C-x\C-g" 'keyboard-quit)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)

(windmove-default-keybindings)
(setq windmove-wrap-around t)

(provide 'init-keys)
