(add-to-list 'load-path (expand-file-name "~/.emacs.d"))

(require 'init-path)
(require 'init-autosave)
(require 'init-interface)
(require 'init-whitespace)
(require 'init-keys)
(require 'init-shell)
(require 'init-packages)
(require 'init-nyan)

(require 'init-clojure)
(require 'init-yaml)

;; local settings
(if (file-exists-p "~/.emacslocal")
    (load "~/.emacslocal"))
