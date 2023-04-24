;;; flowers-theme.el --- flowers
;;; Version: 1.0
;;; Commentary:
;;; A theme called flowers
;;; Code:

(deftheme flowers "A theme from flowers")
(custom-theme-set-faces
 'flowers
 '(default ((t (:foreground "#e685b5" :background "#ffffff" ))))
 '(cursor ((t (:background "#f8c2d3" ))))
 '(fringe ((t (:background "#f1d9e3" ))))
 '(mode-line ((t (:foreground "#c1597e" :background "#fceef3" ))))
 '(mode-line-inactive ((t (:foreground "#f8c2d3" :background "#fffefb" ))))
 '(region ((t (:background "#f69cba" ))))
 '(secondary-selection ((t (:background "#f2b0c0" ))))
 '(font-lock-builtin-face ((t (:foreground "#d58fac" ))))
 '(font-lock-comment-face ((t (:foreground "#f2b0c0" ))))
 '(font-lock-function-name-face ((t (:foreground "#f2b0c0" ))))
 '(font-lock-keyword-face ((t (:foreground "#d16572" ))))
 '(font-lock-string-face ((t (:foreground "#dda3b8" ))))
 '(font-lock-type-face ((t (:foreground "#e685b5" ))))
 '(font-lock-constant-face ((t (:foreground "#a0303d" ))))
 '(font-lock-variable-name-face ((t (:foreground "#f69cba" ))))
 '(minibuffer-prompt ((t (:foreground "#eb99b4" :bold t ))))
 '(font-lock-warning-face ((t (:foreground "#f62356" :bold t))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#de718b" ))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#d58fac" ))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#dda3b8" ))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#f2b6d9" ))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#e685b5" ))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#e260ab" ))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#d43182" ))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#ed6790" ))))
 '(lsp-ui-doc-background ((t (:background "#fceef3"))))
 )

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'flowers)

;;; flowers-theme.el ends here
