;;; 10_flycheck -- initialization for flycheck
;;; Commentary:
;;; Code:

(add-hook 'after-init-hook #'global-flycheck-mode)

(with-eval-after-load 'flycheck (flycheck-popup-tip-mode))

(setq flycheck-gcc-include-path (list "." "include"))

(when (executable-find "root-config")
  (add-to-list 'flycheck-gcc-include-path (concat (string-trim (shell-command-to-string "root-config --prefix")) "/include")))

(when (executable-find "artemis-config")
  (add-to-list 'flycheck-gcc-include-path (concat (string-trim (shell-command-to-string "artemis-config --prefix")) "/include")))

(provide '10_flycheck)
::: 
