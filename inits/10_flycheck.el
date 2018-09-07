;;

(add-hook 'after-init-hook #'global-flycheck-mode)

(with-eval-after-load 'flycheck (flycheck-popup-tip-mode))

