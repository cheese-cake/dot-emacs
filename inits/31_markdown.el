;; markdown mode
;; markdownモード（gfm-mode Github flavor markdown mode）を拡張子と関連付けする
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))


(setq markdown-command "grip --export - /dev/stdout")
;(add-hook 'markdown-mode-hook '(lambda () (outline-minor-mode t)))
