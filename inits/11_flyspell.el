;; flyspell

(setq-default ispell-program-name "aspell")
(eval-after-load "ispell"
  '(add-to-list 'ispell-skip-region-alist '("[^\000-\377]+")))


(mapc                                   ;; flyspell-mode
 (lambda (hook)
   (add-hook hook 'flyspell-prog-mode))
 '(
   c++-mode-hook
   emacs-lisp-mode-hook
   ruby-mode-hook
   python-mode-hook
   ))
(mapc
 (lambda (hook)
   (add-hook hook
             '(lambda () (flyspell-mode 1))))
 '(
   LaTeX-mode-hook
   ))
