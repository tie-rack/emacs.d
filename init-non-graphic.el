(require 'color-theme)

(defun color-theme-shea ()
  (color-theme-install
   '(color-theme-shea
     ((background-color . "#000000")
      (background-mode . dark)
      (cursor-color . "#FFFFFF")
      (foreground-color . "#FFFFFF"))

     (default ((t (nil))))
     (bold ((t (:bold t))))
     (italic ((t (:italic t))))
     (bold-italic ((t (:italic t :bold t))))
     (underline ((t (:underline t))))

     (diff-added ((t (:foreground "#009900" :background "#000000"))))
     (diff-removed ((t (:foreground "#FF0000" :background "#000000"))))
     (diff-file-header ((t (:foreground "#AAAA44" :background "#222222"))))
     (diff-hunk-header ((t (:foreground "#FFFF00" :background "#0000FF"))))

     (font-lock-builtin-face ((t (:foreground "#B09FD4"))))
     (font-lock-comment-face ((t (:foreground "#FF7722" :italic t))))
     (font-lock-constant-face ((t (:foreground "#AAFFBB"))))
     (font-lock-doc-string-face ((t (:foreground "#A5C261"))))
     (font-lock-function-name-face ((t (:foreground "#B0D8FF"))))
     (font-lock-keyword-face ((t (:foreground "#00FFFF"))))
     (font-lock-preprocessor-face ((t (:foreground "#FFFFAD"))))
     (font-lock-string-face ((t (:foreground "#FFBB99"))))
     (font-lock-type-face ((t (:foreground "white"))))

     (isearch ((t (:background "#003300"))))
     (lazy-highlight ((t (:background "#777700"))))
     (region ((t (:background "#0000FF"))))
     (secondary-selection ((t (:background "#444400"))))

     (minibuffer-prompt ((t (:foreground "#00FFFF"))))
     (mode-line ((t (:background "#EEEEEE" :foreground "black"))))
     (mode-line-buffer-id ((t (:background "#FFFFFF" :foreground "black" :bold t))))
     (mode-line-inactive ((t (:background "#999999" :foreground "black"))))

     (rainbow-delimiters-depth-1-face ((t (:foreground "#FFFFFF"))))
     (rainbow-delimiters-depth-2-face ((t (:foreground "#FFBBB8"))))
     (rainbow-delimiters-depth-3-face ((t (:foreground "#96A85E"))))
     (rainbow-delimiters-depth-4-face ((t (:foreground "#D1C236"))))
     (rainbow-delimiters-depth-5-face ((t (:foreground "#8B77D1"))))
     (rainbow-delimiters-depth-6-face ((t (:foreground "#77D1BB"))))
     (rainbow-delimiters-depth-7-face ((t (:foreground "#F1F181"))))
     (rainbow-delimiters-depth-8-face ((t (:foreground "#999999"))))
     (rainbow-delimiters-depth-9-face ((t (:foreground "#33D9D9"))))

     (vertical-border ((t (:foreground "white" :background "#333333")))))))

(color-theme-shea)

;;; Terminal.app doesn't get some paredit keys correctly
(global-set-key "\C-c)" 'paredit-forward-slurp-sexp)
(global-set-key "\C-c}" 'paredit-forward-barf-sexp)
(global-set-key "\C-c(" 'paredit-backward-slurp-sexp)
(global-set-key "\C-c{" 'paredit-backward-barf-sexp)

(provide 'init-non-graphic)
