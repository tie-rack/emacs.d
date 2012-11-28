(global-set-key [S-backspace] 'backward-delete-char)
(global-set-key "\C-c\C-y" 'clipboard-yank)
(defun switch-to-scratch nil
  (interactive)
  (switch-to-buffer "*scratch*"))
(global-set-key "\C-cb" 'switch-to-scratch)
(global-set-key "\M-`" 'other-window)
; I'd rather this than seeing "C-x C-g is undefined" all the time
(global-set-key "\C-x\C-g" 'keyboard-quit)

;; I find myself needing to adjust the frame height on occasion
(defun adjust-frame-height (adjustment)
  (interactive)
  (set-frame-height (selected-frame) (+ (frame-height) adjustment)))
(defun shrink-frame nil
  (interactive)
  (adjust-frame-height -1))
(defun expand-frame nil
  (interactive)
  (adjust-frame-height 1))
(global-set-key "\C-c\C-fs" 'shrink-frame)
(global-set-key "\C-c\C-fe" 'expand-frame)

(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)

(windmove-default-keybindings)
(setq windmove-wrap-around t)

(provide 'init-keys)
