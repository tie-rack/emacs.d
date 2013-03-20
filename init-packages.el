;; require-package and set up lovingly copied from github.com/purcell/emacs.d
(defun require-package (package)
  "Ask elpa to install given PACKAGE."
  (unless (package-installed-p package)
    (package-install package)))

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require-package 'clojure-mode)
(require-package 'clojurescript-mode)
(require-package 'closure-lint-mode)
(require-package 'nrepl)
(require-package 'haml-mode)
(require-package 'markdown-mode)
(require-package 'paredit)
(require-package 'scala-mode2)
(require-package 'slime)
(require-package 'yaml-mode)

(provide 'init-packages)
