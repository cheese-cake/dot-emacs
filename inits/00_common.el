;;; 00_common  --- common settings
;;; Code:
;;; Commentary:

;; auto revert on
(global-auto-revert-mode t)


(add-hook 'find-file-hooks 'auto-insert)

(provide '00_common)
;;; 00_common.el ends here
