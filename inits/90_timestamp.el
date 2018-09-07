(require 'time-stamp)
(setq time-stamp-start ".*[ \t]*Last Modified :")
(setq time-stamp-end "$")
;(setq time-stamp-format " %3b %02d, %04y %02H:%02M:%02S %Z")
(setq time-stamp-format " %04y-%02m-%02d %02H:%02M:%02S %Z (ota)")
(global-set-key "\C-ci"
  '(lambda ()
     (interactive)
     (insert (format-time-string "%Y/%m/%d %H:%M:%S"))))



(defun time-stamp-with-locale-c ()
  (let ((system-time-locale "C"))
    (time-stamp)
    nil))

(if (not (memq 'time-stamp-with-locale-c write-file-hooks))
    (add-hook 'write-file-hooks 'time-stamp-with-locale-c))

