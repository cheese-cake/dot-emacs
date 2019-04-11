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

(auctex-latexmk-setup)
(setq TeX-command-default "LatexMk")
(setq auctex-latexmk-inherit-TeX-PDF-mode t)

;; find file in the present directory
(setq LaTeX-includegraphics-read-file 'LaTeX-includegraphics-read-file-relative)


(add-hook 'LaTeX-mode-hook
  (lambda ()
    (setq TeX-command-extra-options "-shell-escape")
  ))


(setq TeX-electric-math (cons "$" "$"))
(setq LaTeX-electric-left-right-brace t)
(setq TeX-arg-right-insert-p nil)
(add-hook 'LaTeX-mode-hook
          '(lambda ()
             (add-to-list 'TeX-command-list
                          '("LatexMK-pLaTeX"
                            "latexmk -e '$latex=q/platex %%O %(file-line-error) %(extraopts) %S %(mode) %%S/' -e '$bibtex=q/pbibtex %%O %%B/' -e '$biber=q/biber %%O --bblencoding=utf8 -u -U --output_safechars %%B/' -e '$makeindex=q/upmendex %%O -o %%D %%S/' -e '$dvipdf=q/dvipdfmx %%O -o %%D %%S/' -norc -gg -pdfdvi %t"
                            TeX-run-TeX nil (latex-mode) :help "Run LatexMK-pLaTeX"))))

(setq reftex-bibpath-environment-variables
      '("~/Work/Bibtex"))
(setq reftex-use-external-file-finders t)
(setq reftex-external-file-finders
       '(("tex" . "kpsewhich -format=.tex %f")
        ("bib" . "kpsewhich -format=.bib %f")))

(setq reftex-bibliography-commands '("bibliography" "nobibliography" "addbibresource"))


