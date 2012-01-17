(setq path "/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin")
(setenv "PATH" path)
(setq exec-path (append '("/usr/local/bin" "/usr/local/sbin") exec-path))

(provide 'init-path)
