(add-hook 'LaTeX-mode-hook '(lambda () (outline-minor-mode t)))
;;
;; RefTeX with AUCTeX
;;
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-auto-save t)
(setq TeX-parse-self t)

(setq LaTeX-float "hbt")
(setq LaTeX-indent-level 2)
(setq LaTeX-item-indent 0)
(setq LaTeX-brace-indent-level 2)
